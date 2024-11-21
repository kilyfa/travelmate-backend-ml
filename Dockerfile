# Gunakan image Python sebagai base
FROM python:3.9-slim

# Set folder kerja di dalam container
WORKDIR /app

# Salin semua file ke dalam container
COPY . /app

# Install semua library dari requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080 untuk Cloud Run
EXPOSE 8080

# Jalankan aplikasi
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]