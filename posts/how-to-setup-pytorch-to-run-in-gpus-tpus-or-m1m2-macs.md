<!--
.. title: How to setup PyTorch to run in GPUs, TPUs or M1/M2 Macs
.. slug: how-to-setup-pytorch-to-run-in-gpus-tpus-or-m1m2-macs
.. date: 2023-01-03 07:19:46 UTC-05:00
.. tags: code,python,pytorch,colab
.. category: 
.. link: 
.. description: 
.. type: text
-->

```sh
# MIT License
# Copyright (c) 2022 Marcelo Benedet Tournier
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# PyTorch setup on Google colab
# 
# If you are running this notebook in a Colab GPU/TPU environment,
# Paste this code block in the top cell of a Google Colab notebook.
# 
# This shell script will install the pytorch TPU libraries needed for support.
# To debug, delete the "--quiet \" line from this cell.
#
# Change library versions below if needed:
# PyTorch setup on Google colab and M1/M2 macs
# 
# If you are running this notebook in a Colab GPU/TPU environment,
# Paste this code block in the top cell of a Google Colab notebook.
# 
# This shell script will install the pytorch TPU libraries needed for support.
# To debug, delete the "--quiet \" line from this cell.
#
# Change library versions below if needed:
!TPU_AVAILABLE=$(env | grep COLAB_TPU_ADDR | wc -l) && \
CLOUD_TPU_CLIENT_VERSION=0.10 && \
PYTORCH_VERSION=1.12.1  && \
TORCH_XLA_VERSION=1.12  && \
if [ $TPU_AVAILABLE = "1" ] ;\
then pip install \
cloud-tpu-client==$CLOUD_TPU_CLIENT_VERSION \
torch==$PYTORCH_VERSION \
https://storage.googleapis.com/tpu-pytorch/wheels/colab/torch_xla-${TORCH_XLA_VERSION}-cp37-cp37m-linux_x86_64.whl \
--quiet \
;\
fi


import torch
import os

# Verify if a GPU is available and if CUDA is properly installed
gpu_available = torch.cuda.is_available()

# Check for TPU availability in notebook environment
tpu_available = os.environ.get('COLAB_TPU_ADDR') is not None

# Run our device selection.
# Preference is for GPU, then TPU, then CPU:
if gpu_available:
    device = torch.device('cuda')

elif tpu_available: 
    import torch_xla 
    import torch_xla.core.xla_model as xm
    device = xm.xla_device()

# run this in a M1/M2 mac:
elif (torch.backends.mps.is_available()) & (torch.backends.mps.is_built()):
    device = torch.device("mps")
    
else:
    device = torch.device('cpu')

print("device in use:", device, "\n---")

# Print GPU info if it is available:
if gpu_available:
    print(os.popen("nvidia-smi").read())
```
