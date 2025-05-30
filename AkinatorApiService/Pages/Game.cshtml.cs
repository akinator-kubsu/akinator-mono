using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Text.Json;
using System.Text;
using System.Net.Http;
using Microsoft.Data.Sqlite;
using System; // Добавлено для DateTime
using System.Collections.Generic; // Добавлено для List
using System.Threading.Tasks; // Добавлено для Task
using Microsoft.AspNetCore.Http; // Добавлено для HttpContext.Session extensions

namespace AkinatorWeb.Pages
{
    public class GameModel : PageModel
    {
        private readonly IHttpClientFactory _clientFactory;
        private static readonly List<AttributeItem> OrderedAttributes = new()
        {
            // Используем переводы из вашей Prolog БД
            new("animated", "является анимированным персонажем"),
            new("live_action", "является актером из игрового кино"),
            new("human", "человек"),
            new("non_human", "не человек"),
            new("male", "мужского пола"),
            new("adult", "взрослый"),
            new("from_the_simpsons", "из мультсериала \"Симпсоны\""),
            new("is_balding", "лысеющий"),
            new("is_a_sponge", "является губкой"), // В Prolog нет is_a_sponge, но есть is_a_sponge в has_attribute. Предполагаю, что перевод "является губкой"
            new("lives_under_sea", "живет под водой"),
            new("is_a_rabbit", "является кроликом/зайцем"), // is_a_rabbit -> 'является кроликом/зайцем' (уточнено, т.к. в БД есть оба)
            new("from_looney_tunes", "из мультсериала \"Луни Тюнз\""),
            new("from_ussr", "из СССР"),
            new("is_optimistic", "оптимистичный"), // is_optimistic -> 'оптимистичный'
            new("from_nickelodeon", "из мультсериала Nickelodeon"),
            new("female", "женского пола"),
            new("child", "ребенок"),
            new("is_a_mouse", "является мышью"),
            new("is_an_early_disney_character", "является одним из первых персонажей Диснея"),
            new("wears_red_shorts", "носит красные шорты"),
            new("wears_white_gloves", "носит белые перчатки"),
            new("has_a_girlfriend_named_minnie", "имеет подругу по имени Минни"),
            new("is_a_global_icon", "является мировой иконой"),
            // is_a_rabbit уже был, оставляю один раз, если это дубликат в вашем исходном C#
            // new("is_a_rabbit", "является кроликом/зайцем"), 
            // from_looney_tunes уже был
            // new("from_looney_tunes", "из мультсериала \"Луни Тюнз\""),
            new("outsmarts_enemies", "перехитривает врагов"), // outsmarts_enemies -> 'перехитривает врагов'
            new("eats_carrots", "ест морковь"), // eats_carrots -> 'ест морковь'
            new("says_whats_up_doc", "говорит \"What's up, doc?\""),
            new("is_a_trickster", "является обманщиком/трикстером"), // is_a_trickster -> 'является обманщиком/трикстером'
            new("is_grey_and_white", "серо-белый"),
            new("is_a_duck", "является уткой"),
            new("is_greedy_or_selfish", "жадный или эгоистичный"), // is_greedy_or_selfish -> 'жадный или эгоистичный'
            new("has_a_lisp", "шепелявит"),
            new("is_black", "черный"),
            new("wears_a_bow_tie", "носит галстук-бабочку"),
            new("lives_in_stone_age", "живет в каменном веке"),
            new("lives_in_bedrock", "живет в Бедроке"),
            new("from_hanna_barbera", "из мультсериала Hanna-Barbera"),
            new("says_yabba_dabba_doo", "говорит \"Yabba Dabba Doo!\""),
            new("has_a_best_friend_named_barney", "имеет лучшего друга по имени Барни"),
            new("works_at_quarry", "работает в карьере"),
            new("wears_animal_skin_clothing", "носит одежду из шкуры животного"),
            new("is_a_dog", "является собакой"),
            new("solves_mysteries", "раскрывает тайны"),
            new("travels_in_a_van_called_mystery_machine", "путешествует на фургоне под названием \"Машина тайн\""),
            new("is_cowardly", "трусливый"),
            new("loves_scooby_snacks", "любит Скуби-Снэки"), // loves_scooby_snacks -> 'любит Скуби-Снэки'
            new("speaks_broken_english", "говорит на ломаном английском"),
            new("loves_food", "любит еду"),
            new("has_a_dog_as_best_friend_named_scooby", "имеет лучшего друга-собаку по имени Скуби"),
            new("is_thin_and_lanky", "худой и долговязый"), // is_thin_and_lanky -> 'худой и долговязый'
            new("wears_a_green_shirt", "носит зеленую рубашку"),
            new("is_a_cat", "является котом/кошкой"),
            new("from_tom_and_jerry", "из мультсериала \"Том и Джерри\""),
            new("is_enemy_of_a_mouse_named_jerry", "является врагом мыши по имени Джерри"),
            new("often_chases_another_character", "часто преследует другого персонажа"),
            new("is_mostly_silent", "в основном молчалив"),
            new("lives_in_a_house", "живет в доме"),
            new("is_grey_or_blue", "серый или синий"), // is_grey_or_blue -> 'серый или синий'
            new("is_brown", "коричневый"),
            new("is_a_bear", "является медведем"),
            new("wears_a_red_shirt", "носит красную рубашку"),
            new("loves_honey", "любит мед"),
            new("lives_in_hundred_acre_wood", "живет в Чудесном Лесу"), // В вашей БД 'живет в Стоакровом Лесу', я использую ваш вариант для C#
            new("is_simple_minded", "простодушный"),
            new("from_disney", "из мультсериалов Диснея"),
            new("is_yellow", "желтый"),
            new("is_a_tiger", "является тигром"),
            new("loves_to_bounce", "любит прыгать"),
            new("has_a_tail_for_bouncing", "имеет хвост для прыжков"),
            new("is_energetic", "энергичный"),
            new("is_orange_with_black_stripes", "оранжевый с черными полосами"),
            new("has_a_temper", "вспыльчивый"), // has_a_temper -> 'вспыльчивый'
            new("wears_a_sailor_shirt", "носит матросскую рубашку"),
            new("has_nephews_named_huey_dewey_louie", "имеет племянников по имени Хьюи, Дьюи и Луи"),
            new("is_often_unlucky", "часто не везет"), // is_often_unlucky -> 'часто не везет'
            new("is_clumsy", "неуклюжий"),
            new("wears_a_hat", "носит шляпу"),
            new("says_gawrsh", "говорит \"Gawrsh!\""),
            new("has_a_son_named_max", "имеет сына по имени Макс"),
            new("is_a_pet", "является домашним животным"),
            new("belongs_to_mickey_mouse", "принадлежит Микки Маусу"),
            new("does_not_speak_human_language", "не говорит на человеческом языке"),
            new("is_very_rich", "очень богат"), // is_very_rich -> 'очень богат'
            new("loves_money", "любит деньги"),
            new("swims_in_gold_coins", "плавает в золотых монетах"), // swims_in_gold_coins -> 'плавает в золотых монетах'
            new("wears_a_top_hat_and_spats", "носит цилиндр и гетры"),
            new("from_ducktales", "из мультсериала \"Утиные истории\""),
            new("is_a_pilot", "является пилотом"),
            new("is_clumsy_pilot", "неуклюжий пилот"), // is_clumsy_pilot -> 'неуклюжий пилот'
            new("works_for_scrooge_mcduck", "работает на Скруджа Макдака"),
            new("wears_a_flight_helmet", "носит летный шлем"),
            new("is_a_ninja_turtle", "является черепашкой-ниндзя"),
            new("wears_blue_mask", "носит синюю маску"),
            new("uses_katanas", "использует катаны"),
            new("is_the_leader_of_the_team", "является лидером команды"),
            new("lives_in_sewers", "живет в канализации"), // lives_in_sewers -> 'живет в канализации'
            new("eats_pizza", "ест пиццу"),
            new("is_the_most_disciplined", "самый дисциплинированный"), // is_the_most_disciplined -> 'самый дисциплинированный'
            new("wears_orange_mask", "носит оранжевую маску"),
            new("uses_nunchucks", "использует нунчаки"),
            new("is_the_jokester_of_the_team", "является шутником в команде"),
            new("loves_pizza_very_much", "очень любит пиццу"),
            new("says_cowabunga", "говорит \"Cowabunga!\""),
            new("uses_surfer_slang", "использует серферский сленг"), // uses_surfer_slang -> 'использует серферский сленг'
            new("is_a_robot", "является роботом"),
            new("can_transform", "может трансформироваться"), // can_transform -> 'может трансформироваться'
            new("transforms_into_a_truck", "трансформируется в грузовик"),
            new("is_a_leader", "является лидером"),
            new("fights_for_good", "сражается за добро"), // fights_for_good -> 'сражается за добро'
            new("from_transformers", "из франшизы \"Трансформеры\""),
            new("is_an_autobot", "является автоботом"), // is_an_autobot -> 'является автоботом'
            new("uses_a_blaster", "использует бластер"),
            new("is_a_villain", "является злодеем"),
            new("fights_for_evil", "сражается за зло"), // fights_for_evil -> 'сражается за зло'
            new("is_a_decepticon", "является десептиконом"), // is_a_decepticon -> 'является десептиконом'
            new("enemy_of_optimus_prime", "враг Оптимуса Прайма"),
            new("transforms_into_a_gun", "трансформируется в пистолет/пушку"), // transforms_into_a_gun -> 'трансформируется в пистолет/пушку'
            new("has_super_strength", "обладает суперсилой"),
            new("says_i_have_the_power", "говорит \"У меня есть сила!\""), // says_i_have_the_power -> 'говорит "У меня есть сила!"'
            new("has_a_secret_identity_as_prince_adam", "имеет тайную личность - принц Адам"),
            new("rides_a_green_tiger_named_battle_cat", "ездит на зеленом тигре по имени Боевой Кот"),
            new("uses_a_magic_sword", "использует волшебный меч"),
            new("from_he_man_and_the_masters_of_the_universe", "из мультсериала \"Хи-Мен и Властелины Вселенной\""),
            new("has_skull_for_a_face", "имеет череп вместо лица"), // has_skull_for_a_face -> 'имеет череп вместо лица'
            new("enemy_of_he_man", "враг Хи-Мена"),
            new("seeks_power", "ищет власть"), // seeks_power -> 'ищет власть'
            new("uses_magic_staff", "использует волшебный посох"),
            new("lives_on_planet_eternia", "живет на планете Этерния"),
            new("is_lazy", "ленивый"),
            new("loves_lasagna", "любит лазанью"),
            new("hates_mondays", "ненавидит понедельники"), // hates_mondays -> 'ненавидит понедельники'
            new("has_a_dog_companion_named_odie", "имеет собаку-компаньона по имени Оди"),
            new("lives_with_human_owner_named_jon_arbuckle", "живет с человеком-хозяином по имени Джон Арбакл"),
            new("from_garfield", "из франшизы \"Гарфилд\""),
            new("from_comic_strip", "из комиксов"),
            // is_simple_minded уже был
            // new("is_simple_minded", "простодушный"),
            new("lives_with_garfield", "живет с Гарфилдом"),
            new("is_owned_by_jon_arbuckle", "принадлежит Джону Арбаклу"), // is_owned_by_jon_arbuckle -> 'принадлежит Джону Арбаклу'
            new("has_floppy_ears", "имеет висячие уши"),
            new("has_a_long_tongue", "имеет длинный язык"),
            new("owns_a_cat_named_garfield", "владеет котом по имени Гарфилд"),
            new("owns_a_dog_named_odie", "владеет собакой по имени Оди"),
            new("is_awkward", "неловкий"), // is_awkward -> 'неловкий'
            new("is_a_cartoonist", "является карикатуристом/художником комиксов"), // is_a_cartoonist -> 'является карикатуристом/художником комиксов'
            new("wears_glasses", "носит очки"),
            new("is_a_bird", "является птицей"),
            new("is_a_woodpecker", "является дятлом"), // is_a_woodpecker -> 'является дятлом'
            new("has_a_distinctive_laugh", "имеет характерный смех"),
            new("wears_gloves", "носит перчатки"),
            new("has_red_crest", "имеет красный хохолок"),
            new("is_a_sailor", "является моряком"),
            new("gains_strength_from_eating_spinach", "получает силу от поедания шпината"),
            new("has_big_forearms", "имеет большие предплечья"),
            new("has_one_eye_closed_or_squinting", "один глаз закрыт или прищурен"),
            new("has_a_girlfriend_named_olive_oyl", "имеет подругу по имени Олив Ойл"),
            new("smokes_a_pipe", "курит трубку"),
            new("is_very_thin", "очень худой"),
            new("wears_red_dress", "носит красное платье"),
            new("is_the_girlfriend_of_popeye", "является девушкой Попая"),
            new("is_often_in_distress", "часто попадает в беду"), // is_often_in_distress -> 'часто попадает в беду'
            new("is_enemy_of_popeye", "враг Попая"),
            new("is_physically_strong", "физически сильный"), // is_physically_strong -> 'физически сильный'
            new("wears_a_cap", "носит кепку"),
            new("has_a_beard", "имеет бороду"),
            new("is_a_bully", "является хулиганом/задирой"), // is_a_bully -> 'является хулиганом/задирой'
            new("is_a_panther", "является пантерой"),
            new("is_pink", "розовый"),
            new("accompanied_by_jazzy_music", "сопровождается джазовой музыкой"),
            new("is_a_detective", "является детективом"),
            new("is_incompetent_detective", "некомпетентный детектив"), // is_incompetent_detective -> 'некомпетентный детектив'
            new("from_the_pink_panther_films", "из фильмов о Розовой пантере"),
            new("causes_chaos", "вызывает хаос"), // causes_chaos -> 'вызывает хаос'
            new("speaks_with_a_french_accent", "говорит с французским акцентом"),
            new("is_an_aardvark", "является трубкозубом"),
            new("goes_to_school", "ходит в школу"),
            new("from_arthur", "из мультсериала \"Артур\""),
            new("has_a_younger_sister_named_dw", "имеет младшую сестру по имени Ди دبليو"), // has_a_younger_sister_named_dw -> 'имеет младшую сестру по имени Ди Дабл-ю'
            new("is_an_explorer", "является исследователем/путешественником"),
            new("asks_questions_to_viewer", "задает вопросы зрителю"),
            new("has_a_monkey_friend_named_boots", "имеет друга-обезьянку по имени Башмачок"),
            new("speaks_some_spanish", "говорит немного по-испански"),
            new("carries_a_backpack", "носит рюкзак"),
            new("is_a_monkey", "является обезьяной"),
            new("wears_red_boots", "носит красные сапоги"),
            new("is_a_companion_to_dora_the_explorer", "является спутником Даши-путешественницы"),
            new("is_purple", "фиолетовый"),
            new("rescues_animals", "спасает животных"),
            new("is_cousin_of_dora", "является двоюродным братом/сестрой Даши"), // is_cousin_of_dora -> 'является двоюродным братом/сестрой Даши'
            new("from_go_diego_go", "из мультсериала \"Вперед, Диего, вперед!\""),
            new("speaks_spanish", "говорит по-испански"),
            new("has_a_jaguar_companion", "имеет компаньона-ягуара"),
            new("is_a_pig", "является свиньей/поросенком"),
            new("loves_jumping_in_muddy_puddles", "любит прыгать по грязным лужам"),
            new("has_a_younger_brother_named_george", "имеет младшего брата по имени Джордж"),
            new("from_peppa_pig", "из мультсериала \"Свинка Пеппа\""),
            new("has_british_accent", "имеет британский акцент"),
            new("loves_dinosaurs", "любит динозавров"),
            new("is_younger_brother_of_peppa", "является младшим братом Пеппы"),
            new("says_dinosaur", "говорит \"Динозавр!\""), // says_dinosaur -> 'говорит "Динозавр!"'
            new("from_russia", "из России"),
            new("is_very_active_or_mischievous", "очень активный или озорной"), // is_very_active_or_mischievous -> 'очень активный или озорной'
            new("lives_near_a_forest", "живет рядом с лесом"),
            new("has_a_bear_friend_named_medved", "имеет друга-медведя по имени Медведь"),
            new("from_masha_and_the_bear", "из \"Маша и Медведь\""), // from_masha_and_the_bear -> 'из "Маша и Медведь"'
            new("lives_in_a_forest_house", "живет в лесном домике"),
            new("is_retired_circus_performer", "бывший цирковой артист"), // is_retired_circus_performer -> 'бывший цирковой артист'
            new("takes_care_of_a_girl_named_masha", "заботится о девочке по имени Маша"),
            new("does_not_speak_human_language_much", "мало говорит на человеческом языке"),
            new("is_a_hedgehog", "является ежом"),
            new("gets_lost_in_fog", "теряется в тумане"),
            new("searches_for_a_bear", "ищет медведя"),
            new("carries_a_bundle", "несет узелок"),
            new("from_philosophical_cartoon", "из философского мультфильма"),
            new("is_very_kind", "очень добрый"), // is_very_kind -> 'очень добрый'
            new("has_mouse_enemies", "имеет врагов-мышей"), // has_mouse_enemies -> 'имеет врагов-мышей'
            new("says_guys_lets_live_together_friendly", "говорит \"Ребята, давайте жить дружно!\""),
            new("sings_songs", "поет песни"),
            new("has_a_small_pig_friend_named_pyatachok", "имеет маленького друга-поросенка по имени Пятачок"),
            new("is_friend_of_vinni_puh_soviet", "является другом Винни-Пуха (советского)"),
            new("is_small", "маленький"), // is_small -> 'маленький'
            new("lives_on_the_roof", "живет на крыше"),
            new("has_a_propeller_on_his_back", "имеет пропеллер на спине"),
            new("is_selfish_or_boastful", "эгоистичный или хвастливый"), // is_selfish_or_boastful -> 'эгоистичный или хвастливый'
            new("loves_jam_and_sweets", "любит варенье и сладости"),
            new("is_friend_of_a_boy_named_malysh", "является другом мальчика по имени Малыш"),
            new("wishes_for_a_dog", "мечтает о собаке"), // wishes_for_a_dog -> 'мечтает о собаке'
            new("lives_with_parents", "живет с родителями"),
            new("is_friend_of_karlson", "является другом Карлсона"),
            new("runs_away_from_home", "сбегает из дома"),
            new("lives_in_a_village", "живет в деревне"),
            new("has_talking_pets", "имеет говорящих питомцев"),
            new("from_prostokvashino", "из \"Простоквашино\""), // from_prostokvashino -> 'из "Простоквашино"'
            new("is_economical_or_practical", "экономный или практичный"), // is_economical_or_practical -> 'экономный или практичный'
            new("owns_a_cow", "владеет коровой"),
            new("wears_a_vest", "носит жилет"),
            new("has_a_moustache", "имеет усы"),
            new("loves_hunting", "любит охоту"),
            new("uses_a_photo_gun", "использует фоторужье"), // uses_a_photo_gun -> 'использует фоторужье'
            new("is_a_wolf", "является волком"),
            new("chases_a_rabbit_named_zayac", "гоняется за зайцем по имени Заяц"),
            new("is_a_hooligan", "является хулиганом"), // is_a_hooligan -> 'является хулиганом'
            new("says_nu_pogodi", "говорит \"Ну, погоди!\""),
            new("wears_a_shirt_and_pants", "носит рубашку и штаны"), // wears_a_shirt_and_pants -> 'носит рубашку и штаны'
            new("is_chased_by_a_wolf_named_volk", "его преследует волк по имени Волк"),
            new("is_resourceful", "находчивый"), // is_resourceful -> 'находчивый'
            new("wears_pants_or_shorts", "носит брюки или шорты"),
            new("has_big_ears", "имеет большие уши"),
            new("is_friend_of_a_crocodile_named_gena", "является другом крокодила по имени Гена"),
            new("works_at_a_zoo_at_first", "сначала работает в зоопарке"),
            new("falls_out_of_orange_box", "выпадает из ящика с апельсинами"), // falls_out_of_orange_box -> 'выпадает из ящика с апельсинами'
            new("is_a_crocodile", "является крокодилом"),
            new("works_at_a_zoo", "работает в зоопарке"),
            new("plays_accordion", "играет на гармошке/аккордеоне"), // plays_accordion -> 'играет на гармошке/аккордеоне'
            new("is_lonely", "одинокий"), // is_lonely -> 'одинокий'
            new("wears_a_suit", "носит костюм"),
            new("has_a_pet_rat_named_larska", "имеет домашнюю крысу по имени Лариска"),
            new("carries_a_purse", "носит сумочку/ридикюль"), // carries_a_purse -> 'носит сумочку/ридикюль'
            new("wears_a_large_hat", "носит большую шляпу"),
            new("likes_to_do_mischief", "любит пакостить"), // likes_to_do_mischief -> 'любит пакостить'
            new("is_a_parrot", "является попугаем"),
            new("imitates_human_speech", "подражает человеческой речи"),
            new("is_boastful", "хвастливый"), // is_boastful -> 'хвастливый'
            new("lives_in_a_city_apartment", "живет в городской квартире"),
            new("is_blue_and_yellow", "сине-желтый"), // is_blue_and_yellow -> 'сине-желтый'
            new("is_a_house_spirit", "является домовым"), // is_a_house_spirit -> 'является домовым'
            new("tells_tales", "рассказывает сказки"), // tells_tales -> 'рассказывает сказки'
            new("wears_a_tunic_and_bast_shoes", "носит рубаху и лапти"), // wears_a_tunic_and_bast_shoes -> 'носит рубаху и лапти'
            new("lives_on_earth_alone", "живет один на Земле"),
            new("cleans_up_trash", "убирает мусор"),
            new("loves_old_movies", "любит старые фильмы"), // loves_old_movies -> 'любит старые фильмы'
            new("collects_items", "коллекционирует предметы"), // collects_items -> 'коллекционирует предметы'
            new("has_a_pet_cockroach", "имеет домашнего таракана"),
            new("from_pixar", "из мультфильмов Pixar"),
            new("has_tread_wheels", "имеет гусеницы/колеса"), // has_tread_wheels -> 'имеет гусеницы/колеса'
            new("comes_from_space", "прибыл из космоса"), // comes_from_space -> 'прибыл из космоса'
            new("is_a_probe", "является зондом/исследовательским роботом"), // is_a_probe -> 'является зондом/исследовательским роботом'
            new("can_fly", "умеет летать"),
            new("has_a_laser_arm", "имеет лазерную руку/оружие"), // has_a_laser_arm -> 'имеет лазерную руку/оружие'
            new("looks_sleek_and_white", "выглядит гладким и белым"), // looks_sleek_and_white -> 'выглядит гладким и белым'
            new("searches_for_plant_life", "ищет растительную жизнь"), // searches_for_plant_life -> 'ищет растительную жизнь'
            new("is_an_ogre", "является огром"),
            new("lives_in_a_swamp", "живет на болоте"),
            new("is_grumpy_at_first", "сначала ворчливый"), // is_grumpy_at_first -> 'сначала ворчливый'
            new("has_a_donkey_friend_named_donkey", "имеет друга-осла по имени Осел"),
            new("marries_a_princess_named_fiona", "женится на принцессе по имени Фиона"),
            new("from_dreamworks", "из мультфильмов Dreamworks"),
            new("is_green", "зеленый"),
            new("is_a_donkey", "является ослом"),
            new("talks_a_lot", "много говорит"), // talks_a_lot -> 'много говорит'
            new("is_friend_of_shrek", "является другом Шрека"),
            new("marries_a_dragon", "женится на драконе"),
            new("is_a_princess", "является принцессой"),
            new("knows_martial_arts", "владеет боевыми искусствами"), // knows_martial_arts -> 'владеет боевыми искусствами'
            new("marries_shrek", "выходит замуж за Шрека"),
            new("transforms_into_an_ogre", "превращается в огра"),
            new("has_a_human_and_ogre_form", "имеет человеческую и огрскую форму"),
            new("is_a_lion", "является львом"),
            new("lives_in_a_zoo_at_first", "сначала живет в зоопарке"),
            new("loves_to_perform", "любит выступать"), // loves_to_perform -> 'любит выступать'
            new("gets_to_madagascar", "попадает на Мадагаскар"), // gets_to_madagascar -> 'попадает на Мадагаскар'
            new("has_a_mane", "имеет гриву"),
            new("is_a_zebra", "является зеброй"),
            new("wants_to_be_wild", "хочет быть диким"), // wants_to_be_wild -> 'хочет быть диким'
            new("has_black_and_white_stripes", "имеет черно-белые полосы"),
            new("is_a_giraffe", "является жирафом"),
            new("is_a_hypochondriac", "ипохондрик"),
            new("has_a_long_neck", "имеет длинную шею"),
            new("is_brown_and_yellow", "коричнево-желтый"), // is_brown_and_yellow -> 'коричнево-желтый'
            new("is_a_hippo", "является бегемотом"),
            new("is_confident", "уверенный в себе"), // is_confident -> 'уверенный в себе'
            new("is_large_in_size", "большого размера"), // is_large_in_size -> 'большого размера'
            new("is_grey", "серый"),
            new("is_a_lemur", "является лемуром"),
            new("thinks_he_is_important", "считает себя важным"),
            new("loves_to_dance", "любит танцевать"),
            new("from_madagascar", "из франшизы \"Мадагаскар\""),
            new("has_a_servant_named_maurice", "имеет слугу по имени Морис"),
            new("wears_a_leaf_crown", "носит корону из листьев"), // wears_a_leaf_crown -> 'носит корону из листьев'
            new("is_a_penguin", "является пингвином"),
            // is_a_leader уже был
            // new("is_a_leader", "является лидером"),
            new("is_a_strategist", "является стратегом"),
            new("is_part_of_a_small_commando_team", "является частью небольшой команды коммандос"),
            new("speaks_in_military_jargon", "говорит на военном жаргоне"), // speaks_in_military_jargon -> 'говорит на военном жаргоне'
            new("is_black_and_white", "черно-белый"),
            new("is_a_panda", "является пандой"),
            new("learns_kung_fu", "учится кунг-фу"),
            new("is_the_dragon_warrior", "является Воином Дракона"),
            new("works_in_a_noodle_shop_at_first", "сначала работает в лапшичной"),
            new("is_clumsy_but_powerful", "неуклюжий, но сильный"), // is_clumsy_but_powerful -> 'неуклюжий, но сильный'
            new("is_a_red_panda", "является красной пандой"), // is_a_red_panda -> 'является красной пандой'
            new("is_a_kung_fu_master", "является мастером кунг-фу"), // is_a_kung_fu_master -> 'является мастером кунг-фу'
            new("trains_po", "тренирует По"), // trains_po -> 'тренирует По'
            new("lives_in_a_temple", "живет в храме"), // lives_in_a_temple -> 'живет в храме'
            new("is_initially_skeptical_of_po", "изначально скептически относится к По"), // is_initially_skeptical_of_po -> 'изначально скептически относится к По'
            new("lives_on_an_island", "живет на острове"),
            new("is_connected_to_the_ocean", "связан с океаном"),
            new("goes_on_a_voyage", "отправляется в плавание"),
            new("has_a_rooster_pet_named_heihei", "имеет петуха по имени Хейхей"),
            new("does_not_have_a_love_interest", "не имеет любовного интереса"), // does_not_have_a_love_interest -> 'не имеет любовного интереса'
            new("is_a_demigod", "является полубогом"), // is_a_demigod -> 'является полубогом'
            new("can_shapeshift", "может менять облик"), // can_shapeshift -> 'может менять облик'
            new("has_a_magic_fish_hook", "имеет волшебный рыболовный крюк"),
            new("travels_with_moana", "путешествует с Моаной"), // travels_with_moana -> 'путешествует с Моаной'
            new("is_covered_in_magical_tattoos", "покрыт магическими татуировками"),
            new("lost_his_fish_hook", "потерял свой рыболовный крюк"), // lost_his_fish_hook -> 'потерял свой рыболовный крюк'
            new("has_very_long_hair", "имеет очень длинные волосы"),
            new("was_locked_in_a_tower", "была заперта в башне"), // was_locked_in_a_tower -> 'была заперта в башне'
            new("uses_a_frying_pan_as_weapon", "использует сковороду как оружие"),
            new("has_a_chameleon_friend_named_pascal", "имеет друга-хамелеона по имени Паскаль"),
            new("is_a_lost_princess", "является потерянной принцессой"), // is_a_lost_princess -> 'является потерянной принцессой'
            new("is_a_thief_at_first", "сначала является вором"), // is_a_thief_at_first -> 'сначала является вором'
            new("has_a_wanted_poster", "имеет плакат \"Разыскивается\""), // has_a_wanted_poster -> 'имеет плакат "Разыскивается"'
            new("travels_with_rapunzel", "путешествует с Рапунцель"), // travels_with_rapunzel -> 'путешествует с Рапунцель'
            new("is_also_known_as_eugene_fitzherbert", "также известен как Юджин Фитцерберт"),
            new("is_charming_and_sarcastic", "обаятельный и саркастичный"), // is_charming_and_sarcastic -> 'обаятельный и саркастичный'
            new("falls_in_love_with_a_princess", "влюбляется в принцессу"), // falls_in_love_with_a_princess -> 'влюбляется в принцессу'
            new("is_a_viking", "является викингом"),
            new("befriends_a_dragon_named_toothless", "дружит с драконом по имени Беззубик"),
            new("is_initially_unskilled_viking", "изначально неумелый викинг"), // is_initially_unskilled_viking -> 'изначально неумелый викинг'
            new("from_how_to_train_your_dragon", "из франшизы \"Как приручить дракона\""),
            new("has_prosthetic_leg", "имеет протез ноги"), // has_prosthetic_leg -> 'имеет протез ноги'
            new("is_inventive", "изобретательный"), // is_inventive -> 'изобретательный'
            new("is_a_dragon", "является драконом"),
            new("is_black_dragon", "является черным драконом"),
            new("is_a_night_fury", "является Ночной Фурией"), // is_a_night_fury -> 'является Ночной Фурией'
            new("cannot_fly_alone", "не может летать один"), // cannot_fly_alone -> 'не может летать один'
            new("is_loyal", "преданный"),
            new("is_skilled_archer", "умелый лучник"),
            new("has_curly_red_hair", "имеет вьющиеся рыжие волосы"),
            new("rides_a_horse_named_angus", "ездит на лошади по имени Ангус"),
            new("rebels_against_tradition", "бунтует против традиций"), // rebels_against_tradition -> 'бунтует против традиций'
            new("uses_a_bow", "использует лук"),
            new("wants_to_be_an_explorer", "хочет быть исследователем"), // wants_to_be_an_explorer -> 'хочет быть исследователем'
            new("is_married_to_carl_fredricksen", "замужем за Карлом Фредриксеном"),
            new("does_not_appear_for_most_of_movie", "не появляется на протяжении большей части фильма"),
            new("travels_in_a_house_with_balloons", "путешествует в доме с воздушными шарами"),
            new("is_a_widower", "вдовец"),
            // is_grumpy_at_first уже был
            // new("is_grumpy_at_first", "сначала ворчливый"),
            new("is_a_retired_balloon_salesman", "отставной продавец воздушных шаров"),
            new("uses_a_cane", "использует трость"),
            new("is_a_wilderness_explorer", "является исследователем дикой природы/юным следопытом"),
            new("helps_an_elderly_man", "помогает пожилому человеку"), // helps_an_elderly_man -> 'помогает пожилому человеку'
            new("is_chubby", "пухлый"), // is_chubby -> 'пухлый'
            new("wears_a_scout_uniform", "носит форму скаута"),
            new("has_a_dog_friend_who_talks_named_dug", "имеет говорящего друга-собаку по имени Даг"),
            new("is_a_car", "является машиной"),
            new("is_a_race_car", "является гоночной машиной"),
            new("is_red", "красный"),
            new("lives_in_radiator_springs", "живет в Радиатор-Спрингс"),
            new("has_a_best_friend_who_is_a_tow_truck_named_mater", "имеет лучшего друга - эвакуатор по имени Мэтр"),
            new("is_a_tow_truck", "является эвакуатором"),
            new("is_rusty", "ржавый"), // is_rusty -> 'ржавый'
            new("is_best_friend_of_lightning_mcqueen", "является лучшим другом Молнии МакКуина"),
            new("loves_to_go_tractor_tipping", "любит опрокидывать тракторы"), // loves_to_go_tractor_tipping -> 'любит опрокидывать тракторы'
            new("is_a_wizard", "является волшебником"),
            new("goes_to_magic_school_hogwarts", "учится в школе магии Хогвартс"),
            new("has_a_scar_on_forehead", "имеет шрам на лбу"),
            new("is_the_main_protagonist", "является главным героем"),
            new("from_harry_potter", "из франшизы \"Гарри Поттер\""),
            new("speaks_to_snakes", "говорит со змеями"),
            new("is_known_as_the_boy_who_lived", "известен как \"мальчик, который выжил\""),
            new("has_an_owl_pet_named_hedwig", "имеет домашнюю сову по имени Букля"),
            new("is_very_smart", "очень умный"),
            new("is_friend_of_harry_potter", "является другом Гарри Поттера"),
            new("uses_magic_wand", "использует волшебную палочку"),
            new("is_muggle_born", "маглорожденный"), // is_muggle_born -> 'маглорожденный'
            new("has_red_hair", "имеет рыжие волосы"),
            new("comes_from_a_large_wizarding_family", "происходит из большой волшебной семьи"),
            new("is_afraid_of_spiders", "боится пауков"),
            // is_loyal уже был
            // new("is_loyal", "преданный"),
            new("wears_black_armor_and_helmet", "носит черные доспехи и шлем"),
            new("uses_the_dark_side_of_the_force", "использует Темную сторону Силы"),
            new("uses_a_red_lightsaber", "использует красный световой меч"),
            new("is_father_of_luk_skaywalker_and_leya_organa", "является отцом Люка Скайуокера и Леи Органы"),
            new("from_star_wars", "из франшизы \"Звездные войны\""),
            new("breathes_loudly", "тяжело дышит"), // breathes_loudly -> 'тяжело дышит'
            new("was_a_jedi", "был джедаем"), // was_a_jedi -> 'был джедаем'
            new("is_a_jedi", "является джедаем"),
            new("uses_the_force", "использует Силу"),
            new("uses_a_lightsaber", "использует световой меч"),
            new("is_a_farm_boy_at_first", "сначала является фермерским парнем"), // is_a_farm_boy_at_first -> 'сначала является фермерским парнем'
            new("discovers_he_has_a_twin_sister_leya", "обнаруживает, что у него есть сестра-близнец Лея"),
            new("fights_against_the_empire", "сражается против Империи"),
            new("destroys_death_star", "уничтожает Звезду Смерти"), // destroys_death_star -> 'уничтожает Звезду Смерти'
            new("is_a_smuggler", "является контрабандистом"),
            new("owns_a_famous_spaceship_millennium_falcon", "владеет знаменитым космическим кораблем \"Тысячелетний Сокол\""),
            new("has_a_wookiee_friend_named_chewbacca", "имеет друга-вуки по имени Чубакка"),
            new("is_sarcastic", "саркастичный"),
            new("flies_kessel_run_in_less_than_12_parsecs", "пролетает Кессельскую дугу менее чем за 12 парсеков"),
            // is_a_princess уже был
            // new("is_a_princess", "является принцессой"),
            new("is_a_leader_of_the_rebellion", "является лидером повстанческого альянса"),
            new("has_twin_brother_luk_skywalker", "имеет брата-близнеца Люка Скайуокера"),
            new("wears_distinctive_hair_buns", "носит характерные прически-\"бублики\""),
            new("is_captured_by_darth_vader", "захвачена Дартом Вейдером"), // is_captured_by_darth_vader -> 'захвачена Дартом Вейдером'
            new("is_an_archaeologist", "является археологом"),
            new("uses_a_whip", "использует кнут"),
            new("wears_a_fedora_hat", "носит шляпу-федору"),
            new("fears_snakes", "боится змей"),
            new("seeks_ancient_artifacts", "ищет древние артефакты"),
            new("from_indiana_jones", "из франшизы \"Индиана Джонс\""),
            new("is_also_a_professor", "также является профессором"), // is_also_a_professor -> 'также является профессором'
            new("is_from_the_future", "прибыл из будущего"), // is_from_the_future -> 'прибыл из будущего'
            new("is_initially_an_antagonist", "изначально является антагонистом"),
            new("says_i_ll_be_back", "говорит \"Я вернусь\""),
            new("has_a_metal_skeleton_under_skin", "имеет металлический скелет под кожей"),
            new("from_the_terminator_franchise", "из франшизы \"Терминатор\""),
            new("protects_john_connor", "защищает Джона Коннора"), // protects_john_connor -> 'защищает Джона Коннора'
            new("has_red_eyes", "имеет красные глаза"),
            new("is_a_mother_of_future_leader_john_connor", "является матерью будущего лидера Джона Коннора"),
            new("fights_against_robots", "сражается против роботов"),
            new("becomes_a_strong_warrior", "становится сильной воительницей"), // becomes_a_strong_warrior -> 'становится сильной воительницей'
            new("is_a_waitress_at_first", "сначала является официанткой"), // is_a_waitress_at_first -> 'сначала является официанткой'
            new("is_paranoid", "параноик"), // is_paranoid -> 'параноик'
            new("travels_through_time", "путешествует во времени"),
            new("uses_a_delorean_to_time_travel", "использует Делореан для путешествий во времени"),
            new("plays_guitar", "играет на гитаре"),
            new("is_friend_of_a_scientist_named_doc_brown", "является другом ученого по имени Док Браун"),
            new("from_back_to_the_future", "из франшизы \"Назад в будущее\""),
            new("is_afraid_of_being_called_chicken", "боится, когда его называют \"цыпленком\""),
            new("skateboards", "катается на скейтборде"), // skateboards -> 'катается на скейтборде'
            new("is_a_scientist", "является ученым"),
            new("invents_a_time_machine", "изобретает машину времени"),
            new("has_wild_white_hair", "имеет растрепанные седые волосы"), // has_wild_white_hair -> 'имеет растрепанные седые волосы'
            new("is_friend_of_marty_mcfly", "является другом Марти МакФлая"),
            new("often_says_great_scott", "часто говорит \"Great Scott!\""),
            new("has_a_dog_pet_named_einstein", "имеет домашнюю собаку по имени Эйнштейн"),
            new("tells_his_life_story_on_a_bench", "рассказывает историю своей жизни на скамейке"),
            // is_simple_minded_but_successful уже был в Prolog, но не в C#, добавляю перевод
            new("is_simple_minded_but_successful", "простодушный, но успешный"),
            new("from_forrest_gump", "из фильма \"Форрест Гамп\""),
            new("loves_shrimp", "любит креветки"),
            new("meets_several_famous_people", "встречает нескольких известных людей"),
            new("says_life_is_like_a_box_of_chocolates", "говорит \"Жизнь как коробка шоколадных конфет\""),
            new("is_a_boxer", "является боксером"),
            new("is_from_philadelphia", "из Филадельфии"), // is_from_philadelphia -> 'из Филадельфии'
            new("fights_famous_opponents", "сражается с известными противниками"),
            new("is_an_underdog", "является аутсайдером/недооцененным"), // is_an_underdog -> 'является аутсайдером/недооцененным'
            new("runs_up_famous_steps", "забегает по известным ступеням"),
            new("from_rocky_franchise", "из франшизы \"Рокки\""),
            new("is_left_handed", "левша"), // is_left_handed -> 'левша'
            new("is_a_police_officer", "является полицейским офицером"),
            new("fights_terrorists_alone_in_a_building", "один сражается с террористами в здании"),
            new("is_often_barefoot_and_bloody", "часто босиком и в крови"), // is_often_barefoot_and_bloody -> 'часто босиком и в крови'
            new("says_yippee_ki_yay", "говорит \"Yippee-ki-yay\""),
            new("from_die_hard_franchise", "из франшизы \"Крепкий орешек\""),
            new("from_new_york_city", "из Нью-Йорка"), // from_new_york_city -> 'из Нью-Йорка'
            new("is_a_pirate", "является пиратом"),
            new("is_eccentric_or_quirky", "эксцентричный или причудливый"), // is_eccentric_or_quirky -> 'эксцентричный или причудливый'
            new("wears_dreadlocks_and_hat", "носит дреды и шляпу"),
            // is_a_trickster уже был
            // new("is_a_trickster", "является обманщиком/трикстером"),
            new("from_pirates_of_the_caribbean", "из франшизы \"Пираты Карибского моря\""),
            new("uses_a_compass_that_points_to_what_he_wants_most", "использует компас, который указывает на то, чего он больше всего хочет"),
            // is_skilled_archer уже был
            // new("is_skilled_archer", "умелый лучник"),
            new("volunteers_for_a_deadly_competition_the_hunger_games", "добровольно участвует в смертельном соревновании \"Голодные игры\""),
            new("starts_a_rebellion", "начинает восстание"), // starts_a_rebellion -> 'начинает восстание'
            new("is_from_district_12", "из Дистрикта 12"), // is_from_district_12 -> 'из Дистрикта 12'
            new("from_the_hunger_games", "из франшизы \"Голодные игры\""),
            new("hunts_to_feed_her_family", "охотится, чтобы прокормить семью"),
            new("is_a_baker_s_son", "сын пекаря"), // is_a_baker_s_son -> 'сын пекаря'
            new("competes_in_a_deadly_competition_the_hunger_games", "участвует в смертельном соревновании \"Голодные игры\""),
            new("can_camouflage", "может маскироваться"), // can_camouflage -> 'может маскироваться'
            new("is_in_love_with_katniss", "влюблен в Китнисс"), // is_in_love_with_katniss -> 'влюблен в Китнисс'
            new("has_horns", "имеет рога"),
            new("wears_dark_clothing", "носит темную одежду"),
            new("is_a_powerful_magic_user", "является могущественным магом/волшебницей"), // is_a_powerful_magic_user -> 'является могущественным магом/волшебницей'
            // is_initially_a_villain уже был
            // new("is_initially_a_villain", "изначально является злодеем"),
            new("from_sleeping_beauty_or_maleficent_film", "из \"Спящей красавицы\" или фильма \"Малефисента\""),
            new("curses_a_baby_princess", "проклинает новорожденную принцессу"), // curses_a_baby_princess -> 'проклинает новорожденную принцессу'
            new("is_a_pet_detective", "является детективом по розыску домашних животных"),
            new("has_a_distinctive_hairstyle", "имеет характерную прическу"),
            new("talks_in_a_funny_way", "забавно разговаривает"), // talks_in_a_funny_way -> 'забавно разговаривает'
            new("from_ace_ventura_franchise", "из франшизы \"Эйс Вентура\""),
            new("loves_animals", "любит животных"),
            new("says_all_righty_then", "говорит \"All righty then!\""),
            new("lives_in_a_simulated_reality_the_matrix", "живет в симулированной реальности - Матрице"),
            new("is_known_as_the_one", "известен как Избранный"), // is_known_as_the_one -> 'известен как Избранный'
            new("can_manipulate_physics_in_the_matrix", "может манипулировать физикой в Матрице"),
            new("wears_a_black_trench_coat", "носит черный плащ"),
            new("is_a_computer_programmer_at_first", "сначала является компьютерным программистом"), // is_a_computer_programmer_at_first -> 'сначала является компьютерным программистом'
            new("from_the_matrix_franchise", "из франшизы \"Матрица\""),
            new("learns_kung_fu_instantly", "мгновенно изучает кунг-фу"), // learns_kung_fu_instantly -> 'мгновенно изучает кунг-фу'
            new("is_a_leader_of_rebels_zion", "является лидером повстанцев Сиона"), // is_a_leader_of_rebels_zion -> 'является лидером повстанцев Сиона'
            new("wears_a_trench_coat_and_sunglasses", "носит плащ и темные очки"),
            new("believes_in_neo", "верит в Нео"), // believes_in_neo -> 'верит в Нео'
            new("offers_a_choice_of_pills", "предлагает выбор таблеток"), // offers_a_choice_of_pills -> 'предлагает выбор таблеток'
            new("is_skilled_in_martial_arts", "владеет боевыми искусствами"), // is_skilled_in_martial_arts -> 'владеет боевыми искусствами' (повтор, но в C# было)
            new("is_captain_of_the_nebuchadnezzar", "капитан корабля \"Навуходоносор\""), // is_captain_of_the_nebuchadnezzar -> 'капитан корабля "Навуходоносор"'
            new("is_a_skilled_hacker", "умелый хакер"), // is_a_skilled_hacker -> 'умелый хакер'
            new("wears_black_leather_clothing", "носит черную кожаную одежду"),
            new("is_in_love_with_neo", "влюблена в Нео"), // is_in_love_with_neo -> 'влюблена в Нео'
            new("rides_a_motorcycle_in_chase", "едет на мотоцикле в погоне"), // rides_a_motorcycle_in_chase -> 'едет на мотоцикле в погоне'
            new("is_a_ranger_at_first", "сначала является следопытом"), // is_a_ranger_at_first -> 'сначала является следопытом'
            new("is_rightful_king_of_gondor", "является законным королем Гондора"),
            new("uses_a_sword_named_anduril", "использует меч Андурил"), // uses_a_sword_named_anduril -> 'использует меч Андурил'
            new("is_part_of_a_fellowship", "является частью Братства (Кольца)"),
            new("is_in_love_with_an_elf_named_arwen", "влюблен в эльфийку по имени Арвен"),
            new("from_the_lord_of_the_rings", "из \"Властелина колец\""), // from_the_lord_of_the_rings -> 'из "Властелина колец"'
            new("is_over_80_years_old", "старше 80 лет"), // is_over_80_years_old -> 'старше 80 лет'
            new("is_old", "старый/древний"), // is_old -> 'старый/древний' (в Prolog 'пожилой', тут 'старый' из OrderedAttributes C#)
            new("wears_grey_or_white_robes", "носит серые или белые одежды/мантию"), // wears_grey_or_white_robes -> 'носит серые или белые одежды/мантию'
            new("uses_a_staff", "использует посох"),
            new("guides_the_protagonist_frodo", "направляет главного героя Фродо"), // guides_the_protagonist_frodo -> 'направляет главного героя Фродо'
            new("fights_a_balrog_in_moria", "сражается с Балрогом в Мории"), // fights_a_balrog_in_moria -> 'сражается с Балрогом в Мории'
            new("lives_in_the_shire", "живет в Шире"),
            new("carries_a_powerful_ring_the_one_ring", "несет могущественное Кольцо Всевластия"),
            new("travels_to_mount_doom", "путешествует к Роковой Горе"), // travels_to_mount_doom -> 'путешествует к Роковой Горе'
            new("has_hairy_feet", "имеет волосатые ноги"),
            new("is_a_gardener", "является садовником"), // is_a_gardener -> 'является садовником'
            new("is_friend_and_companion_of_frodo", "является другом и спутником Фродо"),
            new("is_very_loyal", "очень преданный"), // is_very_loyal -> 'очень преданный'
            new("kills_shelob", "убивает Шелоб"), // kills_shelob -> 'убивает Шелоб'
            new("is_from_gondor", "из Гондора"), // is_from_gondor -> 'из Гондора'
            new("wants_to_use_the_ring", "хочет использовать Кольцо"), // wants_to_use_the_ring -> 'хочет использовать Кольцо'
            new("dies_heroically", "героически погибает"), // dies_heroically -> 'героически погибает'
            // uses_a_shield уже был
            // new("uses_a_shield", "использует щит"),
            new("is_an_elf", "является эльфом"),
            new("has_blonde_hair", "имеет светлые волосы"), // has_blonde_hair -> 'имеет светлые волосы'
            new("is_prince_of_mirkwood", "является принцем Лихолесья"), // is_prince_of_mirkwood -> 'является принцем Лихолесья'
            new("is_a_dwarf", "является гномом"),
            new("uses_an_axe", "использует топор"), // uses_an_axe -> 'использует топор'
            new("argues_with_legolas", "спорит с Леголасом"),
            new("is_son_of_gloin", "является сыном Глоина"), // is_son_of_gloin -> 'является сыном Глоина'
            new("is_enemy_of_batman", "враг Бэтмена"),
            new("has_a_permanent_smile_or_grin", "имеет постоянную улыбку или оскал"),
            new("wears_purple_suit", "носит фиолетовый костюм"),
            new("is_insane", "безумен"), // is_insane -> 'безумен'
            new("is_a_clown_like_criminal", "преступник, похожий на клоуна"), // is_a_clown_like_criminal -> 'преступник, похожий на клоуна'
            new("from_dc_comics", "из DC Comics"),
            new("has_white_skin_and_green_hair", "имеет белую кожу и зеленые волосы"),
            new("is_a_superhero", "является супергероем"),
            new("does_not_have_superpowers", "не имеет суперспособностей"),
            new("uses_gadgets", "использует гаджеты"),
            new("wears_a_bat_themed_costume", "носит костюм в стиле летучей мыши"),
            new("lives_in_gotham_city", "живет в Готэм-Сити"),
            new("has_a_secret_identity_as_bruce_wayne", "имеет тайную личность - Брюс Уэйн"),
            new("is_a_billionaire", "является миллиардером"),
            new("operates_at_night", "действует ночью"), // operates_at_night -> 'действует ночью'
            new("is_a_butler", "является дворецким"), // is_a_butler -> 'является дворецким'
            new("works_for_bruce_wayne", "работает на Брюса Уэйна"),
            new("helps_batman", "помогает Бэтмену"), // helps_batman -> 'помогает Бэтмену'
            new("lives_in_wayne_manor", "живет в поместье Уэйнов"), // lives_in_wayne_manor -> 'живет в поместье Уэйнов'
            new("is_british", "британец"), // is_british -> 'британец'
            new("is_a_father_figure", "является отцовской фигурой"), // is_a_father_figure -> 'является отцовской фигурой'
            // is_a_spy уже был
            // new("is_a_spy", "является шпионом"),
            new("works_for_british_secret_service", "работает на британскую секретную службу"),
            new("travels_the_world", "путешествует по миру"),
            new("is_known_as_007", "известен как 007"), // is_known_as_007 -> 'известен как 007'
            new("likes_martinis_shaken_not_stirred", "любит мартини, взболтанный, но не смешанный"),
            new("from_james_bond_franchise", "из франшизы о Джеймсе Бонде"),
            new("drives_fast_cars", "водит быстрые машины"),
            new("is_a_program", "является программой"), // is_a_program -> 'является программой'
            new("can_copy_himself", "может копировать себя"), // can_copy_himself -> 'может копировать себя'
            new("is_an_antagonist", "является антагонистом"),
            // enemy_of_neo уже был в Prolog, но не в C#, добавляю перевод
            new("enemy_of_neo", "враг Нео"),
            new("wants_to_escape_the_matrix", "хочет сбежать из Матрицы"), // wants_to_escape_the_matrix -> 'хочет сбежать из Матрицы'
            new("owns_a_chocolate_factory", "владеет шоколадной фабрикой"),
            new("is_eccentric", "эксцентричный"),
            new("offers_a_tour", "предлагает экскурсию"), // offers_a_tour -> 'предлагает экскурсию'
            // wears_a_top_hat уже был
            // new("wears_a_top_hat", "носит цилиндр"),
            new("from_charlie_and_the_chocolate_factory", "из \"Чарли и шоколадная фабрика\""),
            new("has_small_workers_called_oompa_loompas", "имеет маленьких работников Умпа-Лумпа"),
            new("is_poor", "бедный"), // is_poor -> 'бедный'
            new("finds_a_golden_ticket", "находит золотой билет"), // finds_a_golden_ticket -> 'находит золотой билет'
            new("is_good_hearted", "добросердечный"), // is_good_hearted -> 'добросердечный'
            new("goes_on_a_factory_tour", "отправляется на экскурсию по фабрике"),
            new("lives_with_his_grandparents", "живет со своими бабушкой и дедушкой"), // lives_with_his_grandparents -> 'живет со своими бабушкой и дедушкой'
            new("inherits_the_factory", "наследует фабрику"), // inherits_the_factory -> 'наследует фабрику'
            new("has_scissors_for_hands", "имеет ножницы вместо рук"),
            new("was_created_by_an_inventor", "был создан изобретателем"), // was_created_by_an_inventor -> 'был создан изобретателем'
            new("is_gentle_despite_appearance", "нежный, несмотря на внешность"), // is_gentle_despite_appearance -> 'нежный, несмотря на внешность'
            new("is_pale_with_dark_hair", "бледный с темными волосами"),
            new("lives_in_a_castle_at_first", "сначала живет в замке"), // lives_in_a_castle_at_first -> 'сначала живет в замке'
            new("from_edward_scissorhands", "из \"Эдвард Руки-ножницы\""),
            new("can_create_ice_sculptures", "может создавать ледяные скульптуры"), // can_create_ice_sculptures -> 'может создавать ледяные скульптуры'
            new("is_not_very_intelligent", "не очень умный"),
            new("travels_with_a_friend_named_lloyd", "путешествует с другом по имени Ллойд"),
            new("wears_distinctive_orange_tuxedo", "носит характерный оранжевый смокинг"), // wears_distinctive_orange_tuxedo -> 'носит характерный оранжевый смокинг'
            new("from_dumb_and_dumber", "из \"Тупой и еще тупее\""),
            new("owns_a_dog_van", "владеет фургоном-собакой"), // owns_a_dog_van -> 'владеет фургоном-собакой'
            // is_not_very_intelligent уже был
            // new("is_not_very_intelligent", "не очень умный"),
            // travels_with_a_friend_named_harry (в Prolog было lloyd, тут harry)
            new("travels_with_a_friend_named_harry", "путешествует с другом по имени Гарри"),
            new("rides_a_mini_bike", "ездит на мини-байке"),
            // from_dumb_and_dumber уже был
            // new("from_dumb_and_dumber", "из \"Тупой и еще тупее\""),
            new("has_a_chipped_tooth", "имеет отколотый зуб"), // has_a_chipped_tooth -> 'имеет отколотый зуб'
            new("is_a_police_detective", "является полицейским детективом"),
            new("is_new_to_the_city", "новичок в городе"), // is_new_to_the_city -> 'новичок в городе'
            new("investigates_serial_murders", "расследует серийные убийства"),
            new("is_partnered_with_an_older_detective_named_somerset", "является напарником пожилого детектива по имени Сомерсет"),
            new("is_impetuous", "импульсивный/несдержанный"), // is_impetuous -> 'импульсивный/несдержанный'
            new("from_se7en", "из фильма \"Семь\""),
            new("is_married", "женат/замужем"),
            // elder
            new("elder", "пожилой"),
            // is_a_police_detective уже был
            // new("is_a_police_detective", "является полицейским детективом"),
            new("is_about_to_retire", "собирается на пенсию"), // is_about_to_retire -> 'собирается на пенсию'
            // investigates_serial_murders уже был
            // new("investigates_serial_murders", "расследует серийные убийства"),
            new("is_partnered_with_a_younger_detective_named_mills", "является напарником молодого детектива по имени Миллс"),
            new("is_methodical", "методичный"),
            // from_se7en уже был
            // new("from_se7en", "из фильма \"Семь\""),
            new("is_wise", "мудрый"), // is_wise -> 'мудрый'
            new("is_a_serial_killer", "является серийным убийцей"),
            new("murders_based_on_seven_deadly_sins", "убивает на основе семи смертных грехов"),
            new("is_methodical_and_intelligent", "методичный и умный"), // is_methodical_and_intelligent -> 'методичный и умный'
            // from_se7en уже был
            // new("from_se7en", "из фильма \"Семь\""),
            new("turns_himself_in", "сам сдается полиции"),
            new("his_face_is_initially_hidden", "его лицо изначально скрыто"), // his_face_is_initially_hidden -> 'его лицо изначально скрыто'
            // has_super_strength уже был
            // new("has_super_strength", "обладает суперсилой"),
            new("turns_green_when_angry", "зеленеет, когда злится"),
            // is_a_scientist_named_bruce_banner (в Prolog было is_a_scientist_named_bruce_banner, здесь просто is_a_scientist, is_a_scientist_named_bruce_banner не найден в attribute_translation)
            // Предполагаю, что нужен перевод для is_a_scientist_named_bruce_banner
            new("is_a_scientist_named_bruce_banner", "ученый по имени Брюс Бэннер"),
            new("is_part_of_avengers_team", "является частью команды Мстителей"),
            new("from_marvel", "из Marvel"),
            new("is_indestructible", "неразрушимый"), // is_indestructible -> 'неразрушимый'
            new("grows_in_size", "увеличивается в размерах"), // grows_in_size -> 'увеличивается в размерах'
            new("wears_a_powered_suit", "носит силовой костюм/броню"), // wears_a_powered_suit -> 'носит силовой костюм/броню'
            // is_a_billionaire уже был
            // new("is_a_billionaire", "является миллиардером"),
            new("is_an_inventor_named_tony_stark", "изобретатель по имени Тони Старк"),
            new("is_sarcastic_or_witty", "саркастичный или остроумный"), // is_sarcastic_or_witty -> 'саркастичный или остроумный', в Prolog есть is_witty
            // is_part_of_avengers_team уже был
            // new("is_part_of_avengers_team", "является частью команды Мстителей"),
            // from_marvel уже был
            // new("from_marvel", "из Marvel"),
            new("has_an_arc_reactor", "имеет дуговой реактор"), // has_an_arc_reactor -> 'имеет дуговой реактор'
            new("is_a_super_soldier", "является суперсолдатом"),
            new("uses_a_shield", "использует щит"),
            new("was_frozen_in_ice", "был заморожен во льду"), // was_frozen_in_ice -> 'был заморожен во льду'
            // is_a_leader уже был
            // new("is_a_leader", "является лидером"),
            // is_part_of_avengers_team уже был
            // new("is_part_of_avengers_team", "является частью команды Мстителей"),
            // from_marvel уже был
            // new("from_marvel", "из Marvel"),
            new("is_from_the_1940s", "из 1940-х годов"), // is_from_the_1940s -> 'из 1940-х годов'
            new("is_honorable", "честный/благородный"), // is_honorable -> 'честный/благородный'
            new("is_a_god", "является богом"),
            new("uses_a_hammer_or_axe_mjolnir_stormbreaker", "использует молот или топор (Мьёльнир, Гром-секира)"),
            new("controls_lightning", "управляет молниями"), // controls_lightning -> 'управляет молниями'
            new("is_from_another_realm_asgard", "из другого мира - Асгарда"), // is_from_another_realm_asgard -> 'из другого мира - Асгарда'
            // is_part_of_avengers_team уже был
            // new("is_part_of_avengers_team", "является частью команды Мстителей"),
            // from_marvel уже был
            // new("from_marvel", "из Marvel"),
            new("has_a_brother_named_loki", "имеет брата по имени Локи"),
            // is_a_spy уже был
            // new("is_a_spy", "является шпионом"),
            new("is_a_master_of_martial_arts", "мастер боевых искусств"),
            // is_from_russia уже был
            // new("is_from_russia", "из России"),
            // is_part_of_avengers_team уже был
            // new("is_part_of_avengers_team", "является частью команды Мстителей"),
            // from_marvel уже был
            // new("from_marvel", "из Marvel"),
            new("wears_black_suit", "носит черный костюм"),
            new("can_shoot_webs", "может стрелять паутиной"),
            new("can_climb_walls", "может лазить по стенам"),
            // wears_a_red_and_blue_suit был в Prolog, но не в C#
            new("wears_a_red_and_blue_suit", "носит красно-синий костюм"),
            new("has_a_spider_sense", "имеет паучье чутье"),
            // lives_in_new_york_city уже был
            // new("lives_in_new_york_city", "живет в Нью-Йорке"),
            // from_marvel уже был
            // new("from_marvel", "из Marvel"),
            new("is_initially_a_high_school_student", "изначально является старшеклассником"),
            new("was_bitten_by_a_radioactive_spider", "был укушен радиоактивным пауком"),
            new("is_a_sorcerer", "является колдуном/магом"),
            new("was_a_surgeon", "был хирургом"),
            // wears_a_red_cloak был в Prolog, но не в C#
            new("wears_a_red_cloak", "носит красный плащ"),
            new("uses_magic_from_hands", "использует магию рук"), // uses_magic_from_hands -> 'использует магию рук'
            // is_part_of_avengers_team уже был
            // new("is_part_of_avengers_team", "является частью команды Мстителей"),
            // from_marvel уже был
            // new("from_marvel", "из Marvel"),
            new("has_eye_of_agamotto", "имеет Глаз Агамотто"), // has_eye_of_agamotto -> 'имеет Глаз Агамотто'
            new("is_a_space_traveler", "является космическим путешественником"),
            new("is_a_leader_of_guardians_of_the_galaxy", "является лидером Стражей Галактики"),
            new("loves_old_music", "любит старую музыку"),
            // uses_blasters уже был
            // new("uses_blasters", "использует бластеры"),
            // from_marvel уже был
            // new("from_marvel", "из Marvel"),
            new("carries_a_walkman", "носит с собой плеер Walkman"), // carries_a_walkman -> 'носит с собой плеер Walkman'
            new("grut", "Грут"), // Это имя персонажа, не атрибут для вопроса
            // male, non_human, from_marvel уже были
            new("is_a_tree_like_creature", "древоподобное существо"),
            new("can_only_say_i_am_groot", "может говорить только \"Я есть Грут\""),
            new("is_friend_of_rocket", "является другом Ракеты"),
            new("is_part_of_guardians_of_the_galaxy", "является частью Стражей Галактики"),
            new("can_regenerate", "может регенерировать"),
            new("is_very_strong", "очень сильный"),
            new("raketa_yenot", "Ракета (Енот)"), // Это имя персонажа
            // male, non_human, from_marvel уже были
            new("is_a_raccoon", "является енотом"),
            new("is_genetically_engineered", "генетически модифицирован"), // is_genetically_engineered -> 'генетически модифицирован'
            new("is_a_skilled_marksman", "умелый стрелок"),
            new("is_friend_of_groot", "является другом Грута"),
            // is_part_of_guardians_of_the_galaxy, is_sarcastic, from_marvel уже были
            new("is_a_master_of_explosives", "мастер взрывчатки"), // is_a_master_of_explosives -> 'мастер взрывчатки'
            new("lyutik_princess_bride", "Лютик (Принцесса-невеста)"), // Имя персонажа
            // female, adult, human, is_a_princess уже были
            new("is_in_love_with_a_farm_boy_named_westley", "влюблена в фермерского парня по имени Уэстли"),
            new("is_captured_by_villains", "захвачена злодеями"), // is_captured_by_villains -> 'захвачена злодеями'
            new("from_the_princess_bride", "из фильма \"Принцесса-невеста\""),
            new("is_beautiful", "красивая"), // is_beautiful -> 'красивая'
            new("uestli_princess_bride", "Уэстли / Грозный Пират Робертс"), // Имя персонажа
            // male, adult, human уже были
            new("is_a_farm_boy_at_first", "сначала является фермерским парнем"),
            new("is_also_known_as_dread_pirate_roberts", "также известен как Грозный Пират Робертс"),
            new("says_as_you_wish", "говорит \"Как пожелаешь\""), // says_as_you_wish -> 'говорит "Как пожелаешь"'
            new("is_skilled_swordsman", "умелый фехтовальщик"),
            // from_the_princess_bride уже был
            new("wears_a_black_mask", "носит черную маску"),
            new("rescues_a_princess_named_buttercup", "спасает принцессу по имени Лютик"), // rescues_a_princess_named_buttercup -> 'спасает принцессу по имени Лютик'
            new("inigo_montoyya", "Иниго Монтойя"), // Имя персонажа
            // male, adult, human, is_skilled_swordsman, from_the_princess_bride уже были
            new("seeks_revenge", "ищет мести"), // seeks_revenge -> 'ищет мести'
            new("says_hello_my_name_is_inigo_montoya", "говорит \"Привет, меня зовут Иниго Монтойя...\""),
            new("has_a_scar_on_his_face", "имеет шрам на лице"),
            new("seeks_a_six_fingered_man", "ищет шестипалого человека"), // seeks_a_six_fingered_man -> 'ищет шестипалого человека'
            new("doroti_geyl", "Дороти Гейл"), // Имя персонажа
            // female, child, human уже были
            new("is_from_kansas", "из Канзаса"), // is_from_kansas -> 'из Канзаса'
            new("travels_to_a_magical_land_oz", "путешествует в волшебную страну Оз"),
            new("has_a_dog_pet_named_toto", "имеет домашнюю собаку по имени Тотошка"),
            new("wears_ruby_slippers", "носит рубиновые туфельки"),
            new("follows_a_yellow_brick_road", "идет по дороге из желтого кирпича"),
            new("from_the_wizard_of_oz", "из книги/фильма \"Волшебник страны Оз\""),
            new("strashila_oz", "Страшила (Волшебник страны Оз)"), // Имя персонажа
            // male, non_human, from_the_wizard_of_oz уже были
            new("is_made_of_straw", "сделан из соломы"),
            new("wants_a_brain", "хочет мозги"), // wants_a_brain -> 'хочет мозги'
            new("travels_with_dorothy", "путешествует с Дороти"),
            new("is_flexible", "гибкий"), // is_flexible -> 'гибкий'
            new("zheleznyi_drovosek_oz", "Железный Дровосек (Волшебник страны Оз)"), // Имя персонажа
            // male, non_human, from_the_wizard_of_oz, travels_with_dorothy уже были
            new("is_made_of_tin", "сделан из жести"),
            new("wants_a_heart", "хочет сердце"),
            new("rusts_easily", "легко ржавеет"), // rusts_easily -> 'легко ржавеет'
            new("truslivyi_lev_oz", "Трусливый Лев (Волшебник страны Оз)"), // Имя персонажа
            // male, non_human, is_a_lion, from_the_wizard_of_oz, travels_with_dorothy уже были
            new("wants_courage", "хочет смелость"),
            new("is_king_of_the_forest_but_afraid", "король леса, но труслив"), // is_king_of_the_forest_but_afraid -> 'король леса, но труслив'
            new("uolter_uayt", "Уолтер Уайт"), // Имя персонажа
            // male, adult, human уже были
            new("is_a_chemistry_teacher_at_first", "сначала является учителем химии"),
            new("becomes_a_drug_dealer", "становится наркоторговцем"),
            new("is_diagnosed_with_cancer", "ему диагностировали рак"), // is_diagnosed_with_cancer -> 'ему диагностировали рак'
            new("cooks_meth", "варит метамфетамин"),
            new("is_known_as_heisenberg", "известен как Хайзенберг"),
            new("from_breaking_bad", "из сериала \"Во все тяжкие\""),
            new("shaves_his_head", "бреет голову"),
            new("dzhessi_pinkman", "Джесси Пинкман"), // Имя персонажа
            // male, adult, human, from_breaking_bad уже были
            // is_a_drug_dealer (нет в attribute_translation)
            new("is_a_drug_dealer", "является наркоторговцем"),
            new("is_partner_of_walter_white", "является партнером Уолтера Уайта"),
            new("says_bitch_a_lot", "часто говорит \"bitch\""),
            new("uses_slang", "использует сленг"),
            new("is_younger_than_his_partner", "моложе своего напарника"),
            new("don_dreyper", "Дон Дрейпер"), // Имя персонажа
            // male, adult, human уже были
            new("works_in_advertising", "работает в рекламном бизнесе"),
            new("has_a_secret_past", "имеет тайное прошлое"),
            new("is_good_at_creating_slogans", "хорошо придумывает слоганы"),
            new("smokes_and_drinks_a_lot", "много курит и пьет"),
            new("from_mad_men", "из сериала \"Безумцы\""),
            new("has_multiple_affairs", "имеет множественные романы/интрижки"), // has_multiple_affairs -> 'имеет множественные романы/интрижки'
            new("toni_soprano", "Тони Сопрано"), // Имя персонажа
            // male, adult, human уже были
            new("is_a_mafia_boss", "является боссом мафии"),
            new("has_panic_attacks", "страдает от панических атак"),
            new("sees_a_therapist_dr_melfi", "посещает терапевта (доктор Мелфи)"),
            new("lives_in_new_jersey", "живет в Нью-Джерси"),
            new("from_the_sopranos", "из сериала \"Клан Сопрано\""),
            new("has_problems_balancing_family_and_crime", "испытывает проблемы с совмещением семьи и криминала"),
            new("doktor_gregori_haus", "Доктор Грегори Хаус"), // Имя персонажа
            // male, adult, human, is_a_doctor, uses_a_cane уже были
            new("solves_medical_mysteries", "раскрывает медицинские тайны"),
            new("is_cynical_or_misanthropic", "циничный или мизантроп"), // is_cynical_or_misanthropic -> 'циничный или мизантроп'
            new("is_addicted_to_painkillers_vicodin", "зависим от обезболивающих (Викодин)"),
            new("works_at_princeton_plainsboro_teaching_hospital", "работает в учебной больнице Принстон-Плейнсборо"),
            new("sherlok_holms", "Шерлок Холмс"), // Имя персонажа
            // male, adult, human, is_a_detective, is_very_intelligent уже были
            new("uses_deduction", "использует дедукцию"),
            new("lives_at_221b_baker_street", "живет по адресу Бейкер-стрит, 221Б"),
            new("has_a_doctor_as_a_companion_named_watson", "имеет компаньона-доктора по имени Ватсон"),
            new("plays_the_violin", "играет на скрипке"),
            new("doktor_dzhon_vatson", "Доктор Джон Ватсон"), // Имя персонажа
            // male, adult, human, is_a_doctor, lives_at_221b_baker_street уже были
            new("is_a_companion_to_sherlock_holmes", "является компаньоном Шерлока Холмса"),
            new("writes_about_adventures", "пишет о приключениях"),
            new("from_sherlock_holmes_stories", "из рассказов о Шерлоке Холмсе"),
            new("was_injured_in_afghanistan", "был ранен в Афганистане"),
            new("deyen_ris_targarien", "Дейенерис Таргариен"), // Это имя персонажа
            // female, adult, human уже были
            new("has_dragons", "имеет драконов"),
            new("has_silver_hair", "имеет серебряные волосы"),
            new("seeks_the_iron_throne", "претендует на Железный трон"),
            new("is_called_mother_of_dragons", "ее называют Матерью Драконов"),
            new("from_game_of_thrones", "из сериала \"Игра престолов\""),
            new("walks_into_fire", "входит в огонь (невредимой)"), // walks_into_fire -> 'входит в огонь (невредимой)'
            new("dzhon_snou", "Джон Сноу"), // Имя персонажа
            // male, adult, human, from_game_of_thrones уже были
            new("serves_on_the_night_watch", "служит в Ночном Дозоре"),
            new("is_a_bastard_son", "является бастардом (незаконнорожденным сыном)"),
            new("fights_against_the_dead", "сражается против мертвых/Белых Ходоков"), // fights_against_the_dead -> 'сражается против мертвых/Белых Ходоков'
            new("has_a_direwolf_pet_named_ghost", "имеет домашнего лютоволка по имени Призрак"),
            new("is_from_the_north", "с Севера (Вестероса)"), // is_from_the_north -> 'с Севера (Вестероса)'
            new("returns_from_death", "возвращается из мертвых"),
            new("tirion_lannister", "Тирион Ланнистер"), // Имя персонажа
            // male, adult, human, is_very_intelligent, from_game_of_thrones, has_a_scar_on_his_face уже были
            new("is_a_dwarf_in_size", "невысокого роста (карлик)"),
            new("drinks_a_lot", "много пьет (вина)"), // drinks_a_lot -> 'много пьет (вина)'
            new("is_from_a_wealthy_and_powerful_family_lannister", "из богатой и влиятельной семьи Ланнистеров"),
            new("baffi_sammers", "Баффи Саммерс"), // Имя персонажа
            // female, adult, human, has_super_strength уже были
            new("fights_vampires", "сражается с вампирами"),
            new("attends_high_school", "учится в старшей школе (изначально)"), // attends_high_school -> 'учится в старшей школе (изначально)'
            new("is_called_the_slayer", "ее называют Истребительницей (вампиров)"),
            new("from_buffy_the_vampire_slayer", "из сериала \"Баффи - истребительница вампиров\""),
            new("lives_in_sunnydale_california", "живет в Саннидейле, Калифорния"),
            new("angel_buffy", "Ангел (Баффиверс)"), // Имя персонажа
            // male, adult, non_human, from_buffyverse, lives_in_los_angeles уже были
            new("is_a_vampire", "является вампиром"),
            new("has_a_soul", "имеет душу (проклятие)"), // has_a_soul -> 'имеет душу (проклятие)'
            new("is_in_love_with_buffy_summers", "влюблен в Баффи Саммерс"),
            new("runs_a_detective_agency", "руководит детективным агентством (позже)"), // runs_a_detective_agency -> 'руководит детективным агентством (позже)'
            new("maykl_skott", "Майкл Скотт"), // Имя персонажа
            // male, adult, human уже были
            new("is_a_manager_of_a_paper_company", "является менеджером бумажной компании"),
            new("is_socially_awkward", "социально неловкий"),
            new("tries_to_be_funny", "пытается шутить (часто неудачно)"), // tries_to_be_funny -> 'пытается шутить (часто неудачно)'
            new("from_the_office_us", "из сериала \"Офис\" (США)"),
            new("says_thats_what_she_said", "говорит \"Это то, что она сказала\""),
            new("duayt_shrutt", "Дуайт Шрут"), // Имя персонажа
            // male, adult, human, is_socially_awkward, from_the_office_us уже были
            new("works_at_a_paper_company", "работает в бумажной компании"),
            new("is_a_salesman", "является продавцом"),
            new("is_a_beet_farmer", "фермер, выращивающий свеклу"), // is_a_beet_farmer -> 'фермер, выращивающий свеклу'
            new("aspires_to_be_manager", "стремится стать менеджером"),
            new("is_assistant_to_the_regional_manager", "является \"помощником регионального менеджера\"")
        };

        public GameModel(IHttpClientFactory clientFactory)
        {
            _clientFactory = clientFactory;
            // Инициализация свойств, чтобы избежать предупреждений о nullable
            Answer = string.Empty;
            CurrentQuestionText = string.Empty;
            FinalResult = string.Empty;
        }

        [BindProperty]
        public string Answer { get; set; }

        [BindProperty]
        public string CurrentQuestionText { get; set; }

        public bool Finished { get; set; } = false;

        [BindProperty]
        public string FinalResult { get; set; }

        public Task<IActionResult> OnGetAsync() // Сделал Task<IActionResult> для единообразия
        {
            HttpContext.Session.SetInt32("CurrentIndex", 0);
            // Убедимся, что сериализуем пустой список, если ничего нет
            var emptyListJson = JsonSerializer.Serialize(new List<string>());
            HttpContext.Session.SetString("YesAnswers", HttpContext.Session.GetString("YesAnswers") ?? emptyListJson);


            if (OrderedAttributes.Count > 0)
            {
                // Используем .Text из AttributeItem
                CurrentQuestionText = $"{OrderedAttributes[0].Text}?";
            }
            else
            {
                CurrentQuestionText = "Нет доступных вопросов.";
                Finished = true; // Если нет атрибутов, игра сразу заканчивается
            }
            return Task.FromResult<IActionResult>(Page());
        }

        private void SaveSession(string username, string characterName)
        {
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(characterName))
                return;

            using var conn = new SqliteConnection("Data Source=akinator.db");
            conn.Open();

            using var cmd = conn.CreateCommand();
            cmd.CommandText = @"
                INSERT INTO Sessions (UserId, CharacterName, StartedAt)
                SELECT Id, @CharacterName, @StartedAt
                FROM Users
                WHERE Username = @Username";

            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@CharacterName", characterName);
            cmd.Parameters.AddWithValue("@StartedAt", DateTime.UtcNow);

            cmd.ExecuteNonQuery();
        }

        public Task<IActionResult> OnPostAsync() // Сделал Task<IActionResult> для единообразия
        {
            var username = HttpContext.Session.GetString("Username");
            if (string.IsNullOrEmpty(username))
            {
                return Task.FromResult<IActionResult>(RedirectToPage("/Login"));
            }

            var currentIndex = HttpContext.Session.GetInt32("CurrentIndex") ?? 0;
            var yesAnswersJson = HttpContext.Session.GetString("YesAnswers") ?? JsonSerializer.Serialize(new List<string>());
            var yesAnswers = JsonSerializer.Deserialize<List<string>>(yesAnswersJson) ?? new List<string>();

            if (Answer == "yes" && currentIndex < OrderedAttributes.Count) // Добавил проверку currentIndex < OrderedAttributes.Count
            {
                yesAnswers.Add(OrderedAttributes[currentIndex].Code);
            }

            currentIndex++;

            if (currentIndex >= OrderedAttributes.Count)
            {
                Finished = true;
                // Здесь должна быть логика обращения к Prolog или C# аналогу для получения результата
                // Пока просто выводим собранные ответы "да"
                FinalResult = $"Игра окончена! Атрибуты, на которые вы ответили 'да': {string.Join(", ", yesAnswers)}";
                // Пример вызова SaveSession, если персонаж угадан (здесь нужен реальный CharacterName)
                // SaveSession(username, "угаданный_персонаж"); 
                return Task.FromResult<IActionResult>(Page());
            }

            HttpContext.Session.SetInt32("CurrentIndex", currentIndex);
            HttpContext.Session.SetString("YesAnswers", JsonSerializer.Serialize(yesAnswers));

            // Используем .Text из AttributeItem
            CurrentQuestionText = $"{OrderedAttributes[currentIndex].Text}?";
            return Task.FromResult<IActionResult>(Page());
        }

        public class AttributeItem
        {
            public string Code { get; set; }
            public string Text { get; set; }

            public AttributeItem(string code, string text)
            {
                Code = code;
                Text = text;
            }
        }
    }
}