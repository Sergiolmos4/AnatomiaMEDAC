FROM python:3.11
ENV PYTHONBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gcc \
        python3-dev \
        musl-dev \
        default-libmysqlclient-dev \
    && apt-get install -y default-mysql-client\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /code

WORKDIR /code
RUN pip install pipenv

COPY Pipfile Pipfile.lock /code/

RUN pipenv install --system --deploy

COPY . /code/
