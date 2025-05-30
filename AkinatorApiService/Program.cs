using AkinatorWeb.Services;
using AkinatorWeb.Mapping;
using Sentry;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddHttpClient();
builder.Services.AddSession();

// Add database service
builder.Services.AddSingleton<IDatabaseService, DatabaseService>();

// Add user service
builder.Services.AddScoped<IUserService, UserService>();

// Add session service
builder.Services.AddScoped<ISessionService, SessionService>();

// Add AutoMapper
builder.Services.AddAutoMapper(typeof(MappingProfile));

// Add Sentry
builder.WebHost.UseSentry(o =>
{
    o.Dsn = "https://d31fac0ec6335ec33e8972670e74fcf0@o4509378568454144.ingest.us.sentry.io/4509378570420224";
    o.Debug = true;
    o.TracesSampleRate = 1.0;
    o.Environment = builder.Environment.EnvironmentName;
    o.MinimumBreadcrumbLevel = LogLevel.Debug;
    o.MinimumEventLevel = LogLevel.Warning;
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
    app.UseHttpsRedirection();
}

app.UseSwagger();
app.UseSwaggerUI();

app.UseStaticFiles();
app.UseSession();
app.UseRouting();
app.UseAuthorization();

// Добавляем Sentry middleware
app.UseSentryTracing();

// Тестовое логирование
SentrySdk.CaptureMessage("Application started", SentryLevel.Info);

// Главная страница: если пользователь залогинен -> Home, иначе -> Index
app.MapGet("/", context =>
{
    var username = context.Session.GetString("Username");
    if (!string.IsNullOrEmpty(username))
    {
        context.Response.Redirect("/Home");
    }
    else
    {
        context.Response.Redirect("/Index");
    }
    return Task.CompletedTask;
});

app.MapRazorPages();
app.MapControllers();

app.Run();
