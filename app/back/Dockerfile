FROM python:3

RUN mkdir /service

COPY . /service/back

WORKDIR /service/back

RUN python3 -m pip install --upgrade pip

RUN python3 -m pip install --upgrade setuptools

RUN pip install -r requirements.txt

RUN python -m grpc_tools.protoc -I . --python_out=. \
           --grpc_python_out=. movie_recommendations.proto

EXPOSE 50051
ENTRYPOINT [ "python", "back.py" ]