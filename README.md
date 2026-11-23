# MiniBlog

Учебный проект — мини-блог на Flask с постами и комментариями. Основная задача — пройти весь путь от разработки приложения до его развёртывания на отдельном сервере.

Стек:
- Python, Flask, Flask-SQLAlchemy
- PostgreSQL
- Nginx
- Docker, Docker Compose
- GitHub Actions (CI)
- GitHub Container Registry (GHCR)
- Ansible, Ansible Vault

Как устроено:

Приложение работает в Docker-контейнерах. Nginx используется как reverse proxy и для раздачи статики, PostgreSQL — для хранения данных.

Для локальной разработки используется Docker Compose с настройкой HTTPS через mkcert. Для production подготовлена отдельная конфигурация Compose, которая использует готовый образ из GHCR.
CI/CD

GitHub Actions запускает проверки при каждом push и pull request:
- Ruff — проверка и форматирование кода.
- Pytest — запуск тестов.
- Docker — сборка образа.
- GHCR — публикация образа при push в main.

Деплой выполняется через Ansible. Сервер получает необходимые конфигурационные файлы, `.env` генерируется из секретов Ansible Vault, после чего запускается Docker Compose с готовым образом из GHCR.
Что реализовано:
- Разделение конфигураций для локальной разработки и production.
- Сборка и публикация Docker-образов через GitHub Actions.
- Развёртывание приложения на удалённом сервере через Ansible.
- Хранение секретов с помощью Ansible Vault.
- Автоматический запуск приложения через Docker Compose.
