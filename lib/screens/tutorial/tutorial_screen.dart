import 'package:flutter/material.dart';

import '../../common/extensions/extensions.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial'),
      ),
      body: DefaultTextStyle(
        style: context.textTheme.titleMedium?.copyWith(
              color: context.theme.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ) ??
            TextStyle(
              color: context.theme.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: const [
            SafeArea(
              child: _StepView(
                text: 'The first step is to open Medium settings',
                assetPath: 'assets/images/step1.png',
              ),
            ),
            _StepView(
              text: 'Scroll right and click Security and apps',
              assetPath: 'assets/images/step2.png',
            ),
            _StepView(
              text: 'Click Integration tokens',
              assetPath: 'assets/images/step3.png',
            ),
            _StepView(
              text: 'Click Description text box',
              assetPath: 'assets/images/step4.png',
            ),
            _StepView(
              text: 'Type integration token name',
              assetPath: 'assets/images/step5.png',
            ),
            _StepView(
              text: 'Click Get token',
              assetPath: 'assets/images/step6.png',
            ),
            Text("That's it. You're done."),
            SafeArea(
              child: SizedBox(
                height: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepView extends StatelessWidget {
  const _StepView({
    Key? key,
    required this.text,
    required this.assetPath,
  }) : super(key: key);

  final String text;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          const SizedBox(
            height: 8,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(assetPath),
          ),
        ],
      ),
    );
  }
}
