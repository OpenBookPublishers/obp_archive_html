FROM python:2

RUN apt-get update && apt-get upgrade -y && apt-get install curl&& \
    pip install --upgrade pip

WORKDIR /usr/src/app

COPY ./config/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt && \
    rm requirements.txt

RUN curl -Ls --show-error https://github.com/OpenBookPublishers/geturls/releases/download/1.0.2/geturls > /usr/bin/geturls && chmod +x /usr/bin/geturls
RUN curl -Ls --show-error https://github.com/OpenBookPublishers/archiveurl/releases/download/1.1/archiveurl > /usr/bin/archiveurl && chmod +x /usr/bin/archiveurl

COPY ./src/* ./

RUN flake8 ./*

CMD ["python", "run"]
