FROM python:3.9-slim

ARG VERSION
ENV VERSION ${VERSION:-2.1.1}

RUN echo "Installing MLFlow ${VERSION}"
RUN apt-get update && apt-get install jq -y
RUN pip install mlflow==${VERSION} psycopg2-binary boto3

EXPOSE 5000

ENTRYPOINT ["bash"]

CMD [ "-c", "mlflow server --backend-store-uri ${BACKEND_STORE_URI} --artifacts-destination ${ARTIFACTS_DESTINATION} --host ${MLFLOW_HOST} --port ${MLFLOW_PORT}"]
