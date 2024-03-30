FROM python:3

RUN mkdir /service

COPY . /service/front

WORKDIR /service/front

RUN python3 -m pip install --upgrade pip

RUN python3 -m pip install --upgrade setuptools

RUN pip install -r requirements.txt

RUN python -m grpc_tools.protoc -I . --python_out=. \
           --grpc_python_out=. movie_recommendations.proto

EXPOSE 5000
ENV FLASK_APP=front.py
ENTRYPOINT [ "flask", "run", "--host=0.0.0.0"]