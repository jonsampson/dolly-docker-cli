FROM python:3.9-slim-buster

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# Clone the transformers repository
RUN git clone https://github.com/huggingface/transformers.git /opt/transformers

WORKDIR /opt/transformers

# Install the transformers library
RUN pip install -e .

# Install other required packages
RUN pip install torch==1.10.0 \
                numpy==1.21.4 \
                sentencepiece==0.1.96 \
                accelerate>=0.12.0 

# Copy the text generation script into the container
COPY generate_text.py /opt/transformers

# Define an entrypoint script that takes the name of the input file as an argument
ENTRYPOINT ["python", "/opt/transformers/generate_text.py"]
