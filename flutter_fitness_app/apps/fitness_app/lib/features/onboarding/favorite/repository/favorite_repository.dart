import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/path.dart';
import 'package:fitness_app/features/onboarding/favorite/model/favorite.dart';

class FavoriteRepository {
  const FavoriteRepository(this.apiClient);

  /// This is an instance of the [ApiClient] class.
  final ApiClient apiClient;

  /// This function [fetchFavorite] is called when loading the favorite data.
  Future<List<Favorite>?> fetchFavorite() async {
    try {
      final response = await this.apiClient.get(endPoint: FAPath.favorite);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        final favorites = data
            .map((e) => Favorite.fromJson(e as Map<String, dynamic>))
            .toList();
        print('ac $favorites');
        return favorites;
      } else {
        throw Exception('Failed to load favorites');
      }
    } on Failure {
      rethrow;
    }
  }
}
