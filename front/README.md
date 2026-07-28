# Мини-блог — этап 0

Простое CRUD-приложение на Flask: посты + комментарии. Хранилище — SQLite (файл `blog.db`,
создаётся автоматически при первом запуске).

## Структура

```
blog-app/
├── app.py              # вся логика: роуты, модели БД
├── requirements.txt    # зависимости Python
└── templates/          # HTML-страницы (Jinja2)
```

## Как запустить локально

1. Установи зависимости (нужен Python 3.10+):
   ```
   pip install -r requirements.txt
   ```
2. Запусти сервер:
   ```
   python app.py
   ```
3. Открой в браузере: http://localhost:5000

Каждый роут в `app.py` подписан комментарием, к какой CRUD-операции относится
(Create / Read / Update / Delete) — читай их вместе с кодом, это самая полезная часть.

## Как загрузить проект в Git и GitHub

### 1. Инициализировать git локально

```bash
cd blog-app
git init
```

Создай файл `.gitignore`, чтобы не закоммитить лишнее (кэш, БД, виртуальное окружение):

```bash
cat > .gitignore << 'EOF'
__pycache__/
*.pyc
instance/
blog.db
.venv/
venv/
EOF
```

### 2. Сделать первый коммит

```bash
git add .
git commit -m "Этап 0: мини-блог с CRUD (Flask + SQLite)"
```

### 3. Создать репозиторий на GitHub

Вариант А — через сайт:
- Зайди на github.com → New repository → дай имя (например `devops-blog-project`) →
  **не** отмечай "Initialize with README" (у тебя уже есть локальный репозиторий) → Create.
- GitHub покажет команды для подключения — используй их (см. пункт 4).

Вариант Б — через GitHub CLI (`gh`), если установлен:
```bash
gh repo create devops-blog-project --public --source=. --remote=origin
```

### 4. Подключить и запушить (если создавал через сайт)

```bash
git remote add origin https://github.com/ТВОЙ_ЛОГИН/devops-blog-project.git
git branch -M main
git push -u origin main
```

После этого код виден на GitHub — это твоя точка отсчёта. Дальше в этап 1 (Docker)
и этап 3 (CI/CD) GitHub Actions будет реагировать именно на пуши в этот репозиторий.

## Что дальше (этап 1)

Когда приложение запущено и закоммичено — пишем `Dockerfile`, чтобы оно
запускалось одной командой `docker run` без установки Python и зависимостей на хосте.
