import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/authentication/authentication_cubit.dart';
import '../../l10n/l10n.dart';
import '../../models/dtos/city.dart';
import '../../navigation/navigation.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.text_hello_world),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocProvider<HomeBloc>(
                create: (context) => HomeBloc(context.read()),
                child: Center(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) => _buildHome(context, state),
                  ),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                context.read<AuthenticationCubit>().setUnauthenticated();
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.login, (route) => false);
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHome(BuildContext context, HomeState state) {
    if (state is LoadCitiesSuccess) {
      return _buildCityList(state.cities);
    } else if (state is LoadCitiesError) {
      return const Text('Error');
    } else if (state is HomeInitial) {
      return ElevatedButton(
        onPressed: () => context.read<HomeBloc>().add(HomeEvent.loadCities),
        child: Text(context.l10n.text_display_some_text),
      );
    } else {
      // Loading
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget _buildCityList(List<City> cities) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          ListTile(key: Key(cities[index].id), title: Text(cities[index].name)),
      itemCount: cities.length,
    );
  }
}
