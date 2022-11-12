import 'package:flutter/material.dart';

import '../../../l10n/l10n.dart';

class BitLogo extends StatelessWidget {
  const BitLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.l10n.text_bit,
        style: Theme.of(context).textTheme.headline1?.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontSize: 64,
            ),
      ),
    );
  }
}
