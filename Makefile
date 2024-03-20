# Default ACR
ACR_NAME?=pcccr
TAG?=latest

%/conda-linux-64.lock: %/environment.yml
	cd $(dir $<); \
	conda-lock --mamba --kind=explicit -p linux-64 -f environment.yml 


build-python:
	az acr build -r $(ACR_NAME) -t planetary-computer/python:latest -t planetary-computer/python:$(TAG) python

build-gpu-pytorch:
	az acr build -r $(ACR_NAME) -t planetary-computer/gpu-pytorch:latest -t planetary-computer/gpu-pytorch:$(TAG) gpu-pytorch

build-gpu-tensorflow:
	az acr build -r $(ACR_NAME) -t planetary-computer/gpu-tensorflow:latest -t planetary-computer/gpu-tensorflow:$(TAG) gpu-tensorflow

build-qgis:
	az acr build -r $(ACR_NAME) -t planetary-computer/qgis:latest -t planetary-computer/qgis:$(TAG) qgis

build-r:
	az acr build -r $(ACR_NAME) -t planetary-computer/r:latest -t planetary-computer/r:$(TAG) r