import 'package:bloc/bloc.dart';

class JokeGenetatorCubit extends Cubit<String> {
  JokeGenetatorCubit() : super('');

  void jokeGenerator(String joke) => emit(joke);
}

enum CategoryName {
  none,
  animal,
  career,
  celebrity,
  dev,
  explicit,
  fashion,
  food,
  history,
  money,
  movie,
  music,
  political,
  religion,
  science,
  sport,
  travel,
}

enum JokeType {
  random,
  fromCategory,
}

CategoryName enumNameGetter(String categoryName) {
  switch (categoryName) {
    case 'animal':
      return CategoryName.animal;
    case 'career':
      return CategoryName.career;
    case 'celebrity':
      return CategoryName.celebrity;
    case 'dev':
      return CategoryName.dev;
    case 'explicit':
      return CategoryName.explicit;
    case 'fashion':
      return CategoryName.fashion;
    case 'food':
      return CategoryName.food;
    case 'history':
      return CategoryName.history;
    case 'money':
      return CategoryName.money;
    case 'movie':
      return CategoryName.movie;
    case 'music':
      return CategoryName.music;
    case 'political':
      return CategoryName.political;
    case 'religion':
      return CategoryName.religion;
    case 'science':
      return CategoryName.science;
    case 'sport':
      return CategoryName.sport;
    case 'travel':
      return CategoryName.travel;
    default:
      return CategoryName.none;
  }
}
