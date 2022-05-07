FROM python:3.10

WORKDIR multimantix

COPY ./ ./

RUN pip install -r requirements.txt

ENTRYPOINT python -m backend.server
