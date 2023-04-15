import argparse
import torch
import os
from transformers import pipeline

parser = argparse.ArgumentParser()
parser.add_argument("input_file", help="Path to the input file")
args = parser.parse_args()

if not os.path.isfile(args.input_file):
    raise ValueError(f"{args.input_file} is not a valid file path")

generate_text = pipeline(model="databricks/dolly-v2-12b",
                         torch_dtype=torch.bfloat16,
                         trust_remote_code=True,
                         device_map="auto")

with open(args.input_file, "r") as f:
    input_text = f.read()

output_text = generate_text(input_text)[0]["generated_text"]

print(output_text)
