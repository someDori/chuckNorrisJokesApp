import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/jokeGenerator/counter.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is empty string', () {
      expect(JokeGenetatorCubit().state, equals(''));
    });

    blocTest<JokeGenetatorCubit, String>(
      'emits passed text when emit is called',
      build: JokeGenetatorCubit.new,
      act: (cubit) => cubit.jokeGenerator('test'),
      expect: () => [equals('test')],
    );
  });
}
