FROM nvidia/cuda:10.2-base-ubuntu18.04
RUN apt update
RUN apt install -y wget
RUN apt install -y git 
RUN apt install -y vim
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py37_23.1.0-1-Linux-x86_64.sh
RUN bash Miniconda3-py37_23.1.0-1-Linux-x86_64.sh -b -p /root/miniconda
RUN /root/miniconda/bin/conda init bash
RUN bash -c 'source /root/.bashrc'
#RUN /root/miniconda/bin/conda activate base
RUN /root/miniconda/bin/conda install -y pip
RUN /root/miniconda/bin/pip install torch==1.8.2+cu102 torchvision==0.9.2+cu102 torchaudio==0.8.2 -f https://download.pytorch.org/whl/lts/1.8/torch_lts.html
RUN git clone https://github.com/ultralytics/yolov5  /root/yolov5
RUN sed -i "s/^torch/#torch/" /root/yolov5/requirements.txt
RUN sed -i "s/opencv-python/opencv-python-headless/" /root/yolov5/requirements.txt
# enable tensorrt and onnyx
RUN sed -i "s/# onnx/onnx/" /root/yolov5/requirements.txt
RUN sed -i "s/# onnx-simplifier/onnx-simplifier/" /root/yolov5/requirements.txt
RUN sed -i "s/# nvidia-pyindex/nvidia-pyindex/" /root/yolov5/requirements.txt
RUN sed -i "s/# nvidia-tensorrt/nvidia-tensorrt/" /root/yolov5/requirements.txt
RUN /root/miniconda/bin/pip install -r /root/yolov5/requirements.txt 