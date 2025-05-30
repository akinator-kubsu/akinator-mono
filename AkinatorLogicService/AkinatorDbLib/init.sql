-- Создаем пользователя если не существует
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'akinator_user') THEN
        CREATE USER akinator_user WITH PASSWORD 'akinator_password';
    END IF;
END
$$;

-- Предоставляем права на базу данных и схему
GRANT ALL PRIVILEGES ON DATABASE akinator_db TO akinator_user;
GRANT ALL ON SCHEMA public TO akinator_user;
GRANT CREATE ON SCHEMA public TO akinator_user;

-- Создаем таблицы
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    last_login_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sessions (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    character_name VARCHAR(500) NOT NULL,
    started_at TIMESTAMP NOT NULL DEFAULT NOW(),
    ended_at TIMESTAMP
);

-- Предоставляем права на таблицы
GRANT ALL PRIVILEGES ON TABLE users TO akinator_user;
GRANT ALL PRIVILEGES ON TABLE sessions TO akinator_user;
GRANT USAGE, SELECT ON SEQUENCE users_id_seq TO akinator_user;
GRANT USAGE, SELECT ON SEQUENCE sessions_id_seq TO akinator_user; 