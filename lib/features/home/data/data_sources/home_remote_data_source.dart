import 'package:crossover_app/constants/urls.dart';
import 'package:crossover_app/features/home/data/models/flashcard_model.dart';
import 'package:crossover_app/features/home/data/models/mcq_model.dart';
import 'package:crossover_app/features/home/data/models/reveal_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HomeRemoteDataSource {
  Future<T> _fetchData<T>(
      String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    final response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final result = fromJson(data);
      return result;
    } else {
      throw Exception('Failed loading data');
    }
  }

  Future<FlashCardModel> getFollowing() async {
    const endpoint = '${Urls.baseUrl}/following';
    final result = await _fetchData<FlashCardModel>(
        endpoint, (item) => FlashCardModel.fromJson(item));
    return result;
  }

  Future<McqModel> getForYou() async {
    const endpoint = '${Urls.baseUrl}/for_you';
    return _fetchData<McqModel>(endpoint, (item) => McqModel.fromJson(item));
  }

  Future<RevealModel> reveal(int id) async {
    final endpoint = '${Urls.baseUrl}/reveal?id=$id';
    final result = await _fetchData<RevealModel>(
        endpoint, (item) => RevealModel.fromJson(item));
    return result;
  }
}
