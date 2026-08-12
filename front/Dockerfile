FROM python:3.12-alpine
RUN useradd -ms /bin/sh -u 1001 app

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python3", "app.py"]

