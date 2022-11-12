import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../l10n/l10n.dart';

class TokenTextField extends HookWidget {
  const TokenTextField({
    Key? key,
    required this.onTextChanged,
  }) : super(key: key);

  final Function(String text) onTextChanged;

  @override
  Widget build(BuildContext context) {
    final tokenTextController = useTextEditingController();
    final isObscureToken = useState(true);
    tokenTextController.addListener(() {
      onTextChanged(tokenTextController.text);
    });

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: tokenTextController,
              obscureText: isObscureToken.value,
              decoration: InputDecoration(
                suffixIcon: _TokenTextFieldActions(
                  isObscureToken: isObscureToken,
                  tokenTextController: tokenTextController,
                ),
                hintText: context.l10n.text_integration_token,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TokenTextFieldActions extends StatelessWidget {
  const _TokenTextFieldActions({
    Key? key,
    required this.isObscureToken,
    required this.tokenTextController,
  }) : super(key: key);

  final ValueNotifier<bool> isObscureToken;
  final TextEditingController tokenTextController;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        IconButton(
          onPressed: () => isObscureToken.value = !isObscureToken.value,
          icon: Icon(
            isObscureToken.value ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        IconButton(
          onPressed: () async {
            final text = await Clipboard.getData(Clipboard.kTextPlain);
            tokenTextController.text = text?.text ?? '';
          },
          icon: const Icon(Icons.paste),
        ),
      ],
    );
  }
}
