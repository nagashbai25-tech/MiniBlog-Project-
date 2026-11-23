#!/usr/bin/env bash
set -euo pipefail

[ -f docker-compose.yml ] && [ -d front ] || { echo "Запусти из корня проекта"; exit 1; }

rm -rf "front/templates copy"
rm -rf "backend " database .nginx
rm -f mine.py front/README.md
for f in envreadingtest jobs secretenv; do rm -f ".github/workflows/$f.yml"; done

# 2. Снимаем с отслеживания git то, чему не место в репозитории (файлы на диске остаются)
git rm -r -q --cached --ignore-unmatch front/__pycache__ front/instance cert

echo "Готово. Проверь изменения:  git status"
