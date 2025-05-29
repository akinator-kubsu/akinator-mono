# TO DO листы для проекта Акинатор

## Предварительный этап

### P0.1: Выбор предметной области и сбор данных
- [x] Определить конкретную область (например, "Персонажи Marvel Comics") - Vladimir CHertousov
- [x] Собрать не менее 150 объектов (персонажей) - Vladimir CHertousov
- [x] Продумать не менее 8 общих вопросов - Vladimir CHertousov
- [x] Начать формировать специфичные вопросы для различения похожих объектов - Vladimir CHertousov

### P0.2: Настройка окружения
- [x] Установить SWI-Prolog via Docker - Artem-Darius Weber
- [x] Установить .NET SDK (включая F#) via Docker - Artem-Darius Weber
- [x] Установить выбранную СУБД (PostgreSQL) via Docker - Artem-Darius Weber
- [x] Настроить IDE для разработки на Prolog, C#, F#, via DevContainers - Artem-Darius Weber

### P0.3: Создание репозитория
- [x] Создать проект на GitLab лаборатории КубГУ - Artem-Darius Weber

## AkinatorLogicService (Prolog)

### Базовый функционал
- [x] Разработать структуру фактов Prolog для объектов (150+) - Vladimir CHertousov
- [x] Разработать структуру фактов Prolog для вопросов (8+) - Vladimir CHertousov
- [x] Реализовать предикаты для задавания вопросов - Vladimir CHertousov
- [x] Реализовать предикаты для обработки ответов - Vladimir CHertousov
- [x] Реализовать предикаты для поиска подходящего объекта - Vladimir CHertousov
- [x] Реализовать раннюю выдачу ответа - Vladimir CHertousov
- [x] Реализовать разные вопросы для разных объектов - Vladimir CHertousov
- [x] Реализовать добавление нового объекта - Vladimir CHertousov

### HTTP Сервис
- [x] Настроить встроенный HTTP-сервер SWI-Prolog - Vladimir CHertousov
- [x] Реализовать endpoint `/game/next_question` или `/game/answer` - Vladimir CHertousov
- [x] Реализовать endpoint `/game/add_object` - Vladimir CHertousov
- [ ] Подготовить OpenAPI спецификацию - Artem-Darius Weber
- [ ] Написать автотесты - Artem-Darius Weber
- [ ] Развернуть на ресурсах лаборатории - Artem-Darius Weber

### Расширенный функционал
- [ ] Реализовать добавление различающих вопросов
- [ ] Добавить endpoint для различающих вопросов
- [ ] Обновить Swagger и автотесты
- [ ] Реализовать дополнительную фичу (например, "лучший следующий вопрос")
- [ ] Добавить endpoint для дополнительной фичи
- [ ] Обновить Swagger и автотесты

## AkinatorApiService (ASP.NET)

### База данных
- [x] Спроектировать схему БД - Artem-Darius Weber
- [x] Создать таблицу Users - Artem-Darius Weber
- [x] Создать таблицу GameSessions - Artem-Darius Weber
- [x] Создать таблицу SessionAnswers - Artem-Darius Weber

### REST API
- [x] Создать ASP.NET Core Web API проект - Meg-Lander
- [x] Настроить EF Core - Artem-Darius Weber
- [x] Реализовать endpoint `/api/users/register` - Artem-Darius Weber
- [x] Реализовать endpoint `/api/users/login` - Artem-Darius Weber
- [x] Реализовать endpoints для сессий - Artem-Darius Weber
- [x] Подготовить OpenAPI спецификацию - Artem-Darius Weber
- [ ] Написать автотесты - Artem-Darius Weber

### Расширенный функционал
- [ ] Расширить схему БД для пользовательских вопросов
- [ ] Добавить таблицу UserAddedQuestions
- [ ] Реализовать endpoint для сохранения пользовательских вопросов
- [ ] Обновить Swagger и автотесты
- [ ] Добавить поддержку дополнительной фичи
- [ ] Расширить схему для данных фичи
- [ ] Добавить API для сохранения/извлечения данных фичи
- [ ] Обновить Swagger и автотесты

## F# Аналитика

### Базовые запросы
- [x] Создать F# проект - Sergey Dudo
- [x] Настроить доступ к БД - Artem-Darius Weber
- [x] Реализовать запрос "Топ-N самых часто угадываемых персонажей" - Sergey Dudo
- [x] Реализовать запрос "Среднее количество вопросов до угадывания" - Sergey Dudo

### Расширенные запросы
- [ ] Реализовать запрос "Пользователи с наибольшим количеством уникальных вопросов"
- [ ] Реализовать запрос "Пары объектов, требующие различающих вопросов"
- [ ] Реализовать запрос "Эффективность предложенных лучших вопросов"

## Клиентское приложение

### Базовый функционал
- [x] Выбрать технологию (Web/Desktop) - Meg-Lander
- [x] Реализовать авторизацию пользователя - Meg-Lander
- [x] Реализовать игровой процесс - Meg-Lander
- [x] Интегрировать с AkinatorLogicService - Artem-Darius Weber
- [x] Интегрировать с AkinatorApiService - Artem-Darius Weber
- [x] Реализовать отображение статистики - Meg-Lander

### Расширенный функционал
- [ ] Реализовать UI для добавления различающих вопросов
- [ ] Реализовать UI для дополнительной фичи
- [ ] Реализовать отображение дерева предметной области
- [ ] Добавить возможность сохранения дерева как изображения 