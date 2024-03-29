import 'package:dio/dio.dart';

final dio = Dio();

Future<String> generateJoke() async {
  // ignore: inference_failure_on_function_invocation
  final response = await dio.get('https://api.chucknorris.io/jokes/random');
  // ignore: avoid_dynamic_calls
  return response.data['value'] as String;
}

Future<List<String>> generateCategories() async {
  // ignore: inference_failure_on_function_invocation
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
  // ignore: inference_failure_on_function_invocation
  final response = await dio.get(
    'https://api.chucknorris.io/jokes/random',
    queryParameters: {'category': category},
  );
  return response as String;
}
