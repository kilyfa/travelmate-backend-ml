# Gunakan image Python sebagai base
FROM python:3.9-slim

# Set folder kerja di dalam container
WORKDIR /app

# Salin semua file ke dalam container
COPY . /app

# Install dependensi sistem yang diperlukan (opsional, jika ada error TensorFlow atau lainnya)
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgomp1 && \
    rm -rf /var/lib/apt/lists/*

# Install semua library dari requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Pastikan file model dan data dapat diakses (jika ada masalah path, tambahkan langkah berikut ini)
COPY model_destinasi_wisatav2.h5 /app/model_destinasi_wisatav2.h5
COPY DataDestinasi.csv /app/DataDestinasi.csv

# Expose port 8080 untuk Cloud Run
EXPOSE 8080

# Jalankan aplikasi dengan Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
