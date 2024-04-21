# FROM python:3.12.0

# WORKDIR /code

# COPY ./requirements-dev.txt /code/requirements-dev.txt

# RUN pip install -r code/requirements-dev.txt

# COPY ./api /code/api

# CMD ["uvicorn", "--app-dir=.", "api.main:app", "--host", "0.0.0.0", "--port", "80"]

# FROM alpine:latest
# WORKDIR /app
# COPY requirements.txt .
# RUN apk add --no-cache python3 && \
#     pip3 install --no-cache-dir -r requirements.txt
# RUN pip3 install --no-cache-dir -r requirements.txt
# COPY ./api /app/api
# CMD ["uvicorn", "--app-dir=.", "api.main:app", "--host", "0.0.0.0", "--port", "80"]

FROM alpine:latest
WORKDIR /app
RUN apk update && apk add --no-cache python3 py3-pip
COPY requirements.txt .

COPY ./api /app/api
EXPOSE 8080
CMD ["uvicorn", "--app-dir=.", "main.py", "--host", "0.0.0.0", "--port", "8080"]

