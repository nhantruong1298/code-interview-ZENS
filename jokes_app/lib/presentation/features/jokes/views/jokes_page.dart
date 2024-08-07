import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_app/domain/entities/joke.dart';
import 'package:jokes_app/presentation/features/jokes/notifier/jokes_notifier.dart';
import 'package:jokes_app/presentation/features/jokes/notifier/jokes_state.dart';

class JokesPage extends ConsumerStatefulWidget {
  const JokesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JokesPageState();
}

class _JokesPageState extends ConsumerState<JokesPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(jokesNotifierProvider.notifier).onScreenInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            switch (ref.watch(jokesNotifierProvider)) {
              AsyncData(value: final state) => switch (state.status) {
                  JokesStatus.loaded => _buildJokeView(state.joke!),
                  JokesStatus.error =>
                    const Text('Looks like something went wrong!'),
                  _ => _buildLoading(),
                },
              _ => _buildLoading(),
            }
          ],
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildJokeView(Joke joke) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            joke.setup ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            joke.delivery ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => ref
                    .read(jokesNotifierProvider.notifier)
                    .onLikeJoke(joke.id),
                child: const Icon(Icons.thumb_up),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () => ref
                    .read(jokesNotifierProvider.notifier)
                    .onDislikeJoke(joke.id),
                child: const Icon(Icons.thumb_down),
              ),
            ],
          )
        ],
      ),
    );
  }
}
