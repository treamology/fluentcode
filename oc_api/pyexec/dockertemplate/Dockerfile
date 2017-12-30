FROM python:slim

WORKDIR .

COPY . .

RUN python --version

ENTRYPOINT ["python", "-u", "./runner.py"]