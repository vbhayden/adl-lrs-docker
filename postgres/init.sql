CREATE ROLE "lrs_owner" WITH PASSWORD 'lrs_password';

ALTER ROLE "lrs_owner" WITH LOGIN;

CREATE DATABASE "lrs";
GRANT ALL PRIVILEGES ON DATABASE "lrs" TO "lrs_owner";
