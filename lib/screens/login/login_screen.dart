import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../blocs/authentication/authentication_cubit.dart';
import '../../blocs/user/user_cubit.dart';
import '../../l10n/l10n.dart';
import '../../navigation/navigation.dart';
import 'views/bit_logo.dart';
import 'views/token_text_field.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tokenRef = useState<String>('');

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BitLogo(),
            TokenTextField(
              onTextChanged: (text) => tokenRef.value = text,
            ),
            _LoginButton(token: tokenRef.value),
          ],
        ),
      ),
    );
  }
}

class _LoginButton extends HookWidget {
  const _LoginButton({
    Key? key,
    required this.token,
  }) : super(key: key);

  final String token;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: !isLoading.value
            ? ElevatedButton(
                child: Text(context.l10n.text_login),
                onPressed: () {
                  if (token.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid token!')));
                    return;
                  }
                  isLoading.value = true;

                  context.read<AuthenticationCubit>().setToken(token);
                  context.read<UserCubit>().getUserInfo().then((value) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.home, (route) => false);
                  });
                },
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
