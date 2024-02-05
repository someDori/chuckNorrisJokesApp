import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/jokeGenerator/api/joke_api.dart';
import 'package:my_app/jokeGenerator/counter.dart';
import 'package:my_app/l10n/l10n.dart';

class CategoryJokePage extends StatelessWidget {
  const CategoryJokePage({required this.categories, super.key});
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (_) => JokeGenetatorCubit(),
          child: CategoryJokeView(
            categories: categories,
          ),
        ),
      ),
    );
  }
}

class CategoryJokeView extends StatelessWidget {
  const CategoryJokeView({required this.categories, super.key});
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(categories.length, (index) {
          return InkWell(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  categories[index],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                // ignore: inference_failure_on_instance_creation
                MaterialPageRoute(
                  builder: (context) => SingleCategoryJokeView(
                    category: categories[index],
                  ),
                ),
              );
              print(categories[index]);
            },
          );
        }),
      ),
    );
  }
}

class SingleCategoryJokeView extends StatelessWidget {
  const SingleCategoryJokeView({
    required this.category,
    super.key,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appbar')),
      body: BlocBuilder<JokeGenetatorCubit, String>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                context.select(
                  (JokeGenetatorCubit cubit) => cubit.state,
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.read<JokeGenetatorCubit>().jokeGenerator(
                await generateCategoryJoke(category),
              );
        },
      ),
    );
  }
}
