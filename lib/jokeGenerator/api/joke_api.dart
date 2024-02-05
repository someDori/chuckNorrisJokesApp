import 'package:dio/dio.dart';

final dio = Dio();

Future<String> generateJoke() async {
  final response = await dio.get('https://api.chucknorris.io/jokes/random');
  print(response.data['value']);
  return response.data['value'] as String;
}

Future<List<String>> generateCategories() async {
  final response = await dio.get('https://api.chucknorris.io/jokes/categories');
  try {
    final stringList = (response.data as List<dynamic>)
        .map((dynamicValue) => dynamicValue.toString())
        .toList();
    return stringList;
  } catch (e) {
    throw Exception(e);
  }
}

Future<String> generateCategoryJoke(String category) async {
  final response = await dio.get(
    'https://api.chucknorris.io/jokes/random',
    queryParameters: {'category': category},
  );
  print(response.data);
  return response as String;
}
