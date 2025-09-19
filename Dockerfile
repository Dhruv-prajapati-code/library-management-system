FROM python:3.11-slim AS build

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY . .

ENV FLASK_APP=app.py
ENV FLASk_ENV=development



FROM python:3.11-slim

WORKDIR /usr/src/app 

RUN useradd -m appuser
USER appuser

COPY --from=build /usr/src/app /usr/src/app
COPY . .




ENV FLASK_APP=app.py
ENV FLASk_ENV=development


CMD ["flask", "run"]
