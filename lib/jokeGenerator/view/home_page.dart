import 'package:flutter/material.dart';
import 'package:my_app/jokeGenerator/api/joke_api.dart';
import 'package:my_app/jokeGenerator/counter.dart';
import 'package:my_app/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10.counterAppBarTitle)),
      body: const Center(
        child: HomeText(),
      ),
    );
  }
}

class HomeText extends StatefulWidget {
  const HomeText({super.key});

  @override
  State<HomeText> createState() => _HomeTextState();
}

class _HomeTextState extends State<HomeText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        OutlinedButton(
          onPressed: () async {
            // ignore: unawaited_futures, use_build_context_synchronously
            Navigator.push(
              context,
              // ignore: inference_failure_on_instance_creation
              MaterialPageRoute(
                builder: (context) => const RandomJokePage(),
              ),
            );
          },
          child: const Text('Random Joke'),
        ),
        OutlinedButton(
          onPressed: () async {
            final categories = await generateCategories();
            // ignore: unawaited_futures, use_build_context_synchronously
            Navigator.push(
              context,
              // ignore: inference_failure_on_instance_creation
              MaterialPageRoute(
                builder: (context) => CategoryJokePage(
                  categories: categories,
                ),
              ),
            );
          },
          child: const Text('Joke from a category'),
        ),
        const Spacer(),
      ],
    );
  }
}
