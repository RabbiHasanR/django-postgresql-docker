# Pull Base Image

FROM python:3.7-alpine

# Set Environment Variables

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set Working Directory
WORKDIR /app

# Copy Files
COPY requirements.txt /app/

# Install Python Dependencies
RUN pip install -r requirements.txt

# Copy Project Files
COPY . /app/