# 基于Ubuntu 20.04构建Docker镜像
FROM registry.baidubce.com/paddlepaddle/paddle:2.4.2-gpu-cuda11.2-cudnn8.2-trt8.0

RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

# 更新apt源并安装必要的软件包
RUN apt-get update && apt-get install -y \
    python3\
    python3-pip

# 将当前目录下的PaddlePaddle模型复制到Docker镜像的工作目录
COPY . /app

# 设置工作目录
WORKDIR /app

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --trusted-host pypi.tuna.tsinghua.edu.cn -r requirements.txt

# 运行PaddlePaddle模型
CMD ["hub", "serving", "start", "-c", "hubserving/kie_ser/config.json"]
