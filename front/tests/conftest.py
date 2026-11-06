import os
 
# app.py читает POSTGRES_URL при импорте. В тестах Postgres нет,
# поэтому подставляем SQLite в памяти ДО импорта app.
os.environ.setdefault("POSTGRES_URL", "sqlite:///:memory:")
 
