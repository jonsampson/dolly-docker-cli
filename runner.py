import torch
from transformers import pipeline

with open(sys.argv[1], 'r') as file:
    data = file.read().replace('\n', '')

# use dolly-v2-12b if you're using Colab Pro+, using pythia-2.8b for Free Colab
generate_text = pipeline(model="databricks/dolly-v2-2-8b", 
                         torch_dtype=torch.bfloat16, 
                         trust_remote_code=True,
                         device_map="auto")

generate_text(data)