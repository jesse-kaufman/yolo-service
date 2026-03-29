FROM nvidia/cuda:13.2.0-cudnn-runtime-ubuntu24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV MODEL_PATH=yolov8m.pt

RUN apt-get update && apt-get install -y \
    curl python3 python3-pip libgl1 libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip3 install --no-cache-dir \
    fastapi uvicorn ultralytics pillow python-multipart

COPY app/ app/

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
