import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/authentication/authentication_cubit.dart';
import '../../navigation/navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            context.read<AuthenticationCubit>().setAuthenticated();
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.home, (route) => false);
          },
        ),
      ),
    );
  }
}
