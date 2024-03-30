# recommendations/recommendations.py
from concurrent import futures
import random

import grpc

from movie_recommendations_pb2 import (
    MovieCategory,
    MovieRecommendation,
    MovieRecommendationResponse,
)

import movie_recommendations_pb2_grpc

movies_by_category = {
    MovieCategory.MYSTERY: [
        MovieRecommendation(
            id=1, 
            title="Knives Out (2019)"
            ),
        MovieRecommendation(
            id=2, 
            title="Murder on the Orient Express (2017)"
            ),
        MovieRecommendation(
            id=3, 
            title="The Girl With the Dragon Tattoo (2011)"
            ),
    ],
    MovieCategory.SCIENCE_FICTION: [
        MovieRecommendation(
            id=4, 
            title="Snowpiercer (2013)"
            ),
        MovieRecommendation(
            id=5, 
            title="District 9 (2009)"
            ),
        MovieRecommendation(
            id=6, 
            title="Donnie Darko (2001)"
            ),
    ],
    MovieCategory.SELF_HELP: [
        MovieRecommendation(
            id=7, 
            title="The Intouchables (2011)"
            ),
        MovieRecommendation(
            id=8, 
            title="Coach Carter (2005)"
            ),
        MovieRecommendation(
            id=9, 
            title="The Pursuit of Happyness (2006)"
            ),
    ],
}

class RecommendationService(
    movie_recommendations_pb2_grpc.RecommendationsServicer
):
    def Recommend(self, request, context):
        if request.category not in movies_by_category:
            context.abort(grpc.StatusCode.NOT_FOUND, "Category not found")

        movies_for_category = movies_by_category[request.category]
        num_results = min(request.max_results, len(movies_for_category))
        movies_to_recommend = random.sample(
            movies_for_category, num_results
        )

        return MovieRecommendationResponse(recommendations=movies_to_recommend)
    
def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    movie_recommendations_pb2_grpc.add_RecommendationsServicer_to_server(
        RecommendationService(), server
    )
    server.add_insecure_port("[::]:50051")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    serve()