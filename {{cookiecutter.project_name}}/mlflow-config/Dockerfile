FROM python:3.9.18-bookworm

ENV MLFLOW_HOME /home/mlflow
ENV SERVER_PORT 5000
ENV SERVER_HOST 0.0.0.0

RUN pip install mlflow && \
    mkdir -p ${MLFLOW_HOME}/scripts

COPY run.sh ${MLFLOW_HOME}/scripts/run.sh
RUN chmod +x ${MLFLOW_HOME}/scripts/run.sh

EXPOSE ${SERVER_PORT}/tcp

VOLUME ["${MLFLOW_HOME}/scripts/"]

WORKDIR ${MLFLOW_HOME}

ENTRYPOINT ["./scripts/run.sh"]