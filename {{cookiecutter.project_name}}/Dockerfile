FROM python:3.9.18-bookworm

WORKDIR /

# Copy files to the docker image
COPY data /data
COPY src /src
COPY pyproject.toml /pyproject.toml
COPY poetry.lock /poetry.lock

# Install poetry
RUN pip install poetry mlflow

# Uses poetry to install the required libraries
RUN poetry install

# Set enviroment variables
ENV MLFLOW_URL=0.0.0.0
ENV MLFLOW_PORT=5000
ENV EXPERIMENT_NAME=docker-test

# Run the trainer
RUN python src/train.py