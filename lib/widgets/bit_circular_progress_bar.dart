import 'package:flutter/material.dart';

class BitCircularProgressBar extends StatelessWidget {
  const BitCircularProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
