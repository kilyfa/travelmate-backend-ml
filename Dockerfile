FROM python:3.9-slim

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    libgomp1 && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

COPY model_destinasi_wisatav2.h5 /app/model_destinasi_wisatav2.h5
COPY DataDestinasi.csv /app/DataDestinasi.csv

EXPOSE 8080

CMD ["python", "app.py"]
