import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  FullScreenLoader({super.key});
  final messages = <String>[
    'Loading...',
    'Please wait...',
    'Still loading...',
    'Almost there...',
  ];

  Stream<String> getLoadingMessages() {
    return Stream.periodic(const Duration(seconds: 1), (i) => i)
        .map((event) => messages[event % messages.length])
        .take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        StreamBuilder(
          stream: getLoadingMessages(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data as String,
              );
            }

            return const Text('Loading...');
          },
        ),
      ],
    ));
  }
}
