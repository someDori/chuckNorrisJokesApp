import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/jokeGenerator/api/joke_api.dart';
import 'package:my_app/jokeGenerator/cubit/joke_generator_cubit.dart';
import 'package:my_app/l10n/l10n.dart';

class RandomJokePage extends StatelessWidget {
  const RandomJokePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JokeGenetatorCubit(),
      child: const RandomJokeView(),
    );
  }
}

class RandomJokeView extends StatelessWidget {
  const RandomJokeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(
        child: JokeGeneratorText(
          category: CategoryName.none,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context
              .read<JokeGenetatorCubit>()
              .jokeGenerator(await generateJoke());
        },
        child: const Text('Joke'),
      ),
    );
  }
}

class JokeGeneratorText extends StatefulWidget {
  const JokeGeneratorText({required this.category, super.key});
  final CategoryName category;

  @override
  State<JokeGeneratorText> createState() => _JokeGeneratorTextState();
}

class _JokeGeneratorTextState extends State<JokeGeneratorText> {
  @override
  Widget build(BuildContext context) {
    final joke = context.select((JokeGenetatorCubit cubit) => cubit.state);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        joke,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
