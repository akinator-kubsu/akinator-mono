FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Установка необходимых пакетов для SQLite
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Переменные окружения для Sentry
ENV SENTRY_DSN="https://d31fac0ec6335ec33e8972670e74fcf0@o4509378568454144.ingest.us.sentry.io/4509378570420224"
ENV SENTRY_ENVIRONMENT="production"
ENV SENTRY_TRACES_SAMPLE_RATE="1.0"

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["AkinatorWeb.csproj", "./"]
RUN dotnet restore
COPY . .
RUN dotnet build -c Release -o /app/build

FROM build AS publish
RUN dotnet publish -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "AkinatorWeb.dll"] 