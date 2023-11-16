#
FROM python:3.9

#
WORKDIR /app

#
COPY ./requirements.txt /app/requirements.txt

#
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

#
COPY ./ /app

RUN pip install .

COPY ./models /models
ENV MODEL_REPO_PATH=/models

#
CMD ["uvicorn", "smauto.api:api", "--host", "0.0.0.0", "--port", "8080"]
