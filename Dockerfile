# Pull Base Image

FROM python:3.7-alpine

# Set Environment Variables

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set Working Directory
WORKDIR /app

# install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev
# upgrade pip
RUN pip install --upgrade pip
# Copy Files
COPY requirements.txt /app/

# Install Python Dependencies
RUN pip install -r requirements.txt

# copy entrypoint.sh
COPY ./entrypoint.sh /app/
RUN sed -i 's/\r$//g' /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh


# Copy Project Files
COPY . /app/

# run entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]