FROM python:3.10-slim

WORKDIR /dolly-2

RUN apt-get update && apt-get install git -y
RUN pip install "git+https://github.com/huggingface/transformers"
RUN pip install accelerate>=0.12.0 

COPY runner.py .

RUN python runner.py "Say hello world"

CMD [ "python", "runner.py" ]