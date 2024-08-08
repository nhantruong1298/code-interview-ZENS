import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeader(screenHeight),
              switch (ref.watch(jokesNotifierProvider)) {
                AsyncData(value: final state) => switch (state.status) {
                    JokesStatus.loaded =>
                      _buildJokeView(state.joke!, screenHeight, screenWidth),
                    JokesStatus.error =>
                      const Text('Looks like something went wrong!'),
                    _ => _buildLoading(screenHeight),
                  },
                _ => _buildLoading(screenHeight),
              },
              _buildFooter(screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double heightScreen) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 4),
      height: heightScreen * 0.2,
      color: const Color(0xFF2AB363),
      padding: const EdgeInsets.all(16),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'A joke a day keeps the doctor away',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16),
          Text('If you joke wrong way, your teeth have to pay. (Serious)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ))
        ],
      ),
    );
  }

  Widget _buildLoading(double screenHeight) {
    return SizedBox(
      height: screenHeight * 0.5,
      child: const Center(
          child: CircularProgressIndicator(
        color: Color(0xFF2AB363),
      )),
    );
  }

  Widget _buildJokeView(Joke joke, double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            joke.setup ?? '',
            style: const TextStyle(fontSize: 15, color: Color(0xff646464)),
          ),
          const SizedBox(height: 16),
          Text(
            joke.delivery ?? '',
            // textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, color: Color(0xff646464)),
          ),
          SizedBox(height: screenHeight * 0.25),
          _buildLikeAndDislikeButtons(joke.id)
        ],
      ),
    );
  }

  Row _buildLikeAndDislikeButtons(int? jokeId) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () =>
                ref.read(jokesNotifierProvider.notifier).onLikeJoke(jokeId),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2c7edb),
              shape: const RoundedRectangleBorder(),
              padding: EdgeInsets.zero,
            ),
            child: const Text(
              'This is Funny!',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 32),
        Expanded(
          child: ElevatedButton(
            onPressed: () =>
                ref.read(jokesNotifierProvider.notifier).onDislikeJoke(jokeId),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2ab363),
              shape: const RoundedRectangleBorder(),
              padding: EdgeInsets.zero,
            ),
            child: const AutoSizeText(
              'This is Not Funny!',
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(double screenHeight) {
    return const Column(
      children: [
        Divider(
          thickness: 1,
          color: Color(0xfff4f4f4),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
                'This appis created as part of Hisolutions program. The materials contained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the information contained on this site.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xffa3a3a3), fontSize: 12))),
        Center(
            child: Text(
          'Copyright 2021 HLS',
          style: TextStyle(color: Color(0xff959595)),
        ))
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(
            'assets/images/logo.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          )),
      actions: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Handicrafted by',
              style: TextStyle(fontSize: 12, color: Color(0xFFa3a3a3)),
            ),
            Text('Jim HLS',
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF868686),
                    fontWeight: FontWeight.w500))
          ],
        ),
        Image.asset(
          'assets/images/flower.png',
          // width: 50,
          // height: 50,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
