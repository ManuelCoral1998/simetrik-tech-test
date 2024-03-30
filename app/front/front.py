import os

from flask import Flask, render_template
import grpc
from movie_recommendations_pb2 import MovieCategory, MovieRecommendationRequest
from movie_recommendations_pb2_grpc import RecommendationsStub

app = Flask(__name__)

host = os.getenv("RECOMMENDATIONS_HOST", "localhost")

recommendations_channel = grpc.insecure_channel(f"{host}:50051")

recommendations_client = RecommendationsStub(recommendations_channel)

@app.route("/")
def render_home():
    recommendations_request = MovieRecommendationRequest(
        user_id = 1,
        category = MovieCategory.MYSTERY, 
        max_results = 3
    )

    recommendations_response = recommendations_client.Recommend(
        recommendations_request
    )

    return render_template(
        "home.html",
        recommendations=recommendations_response.recommendations
    )
