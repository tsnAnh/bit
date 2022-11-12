import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user/user_cubit.dart';
import '../../../l10n/l10n.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: Text(context.l10n.text_bit)),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserFetched) {
                debugPrint(state.user.imageUrl);
                return CircleAvatar(
                  child: Image.network(state.user.imageUrl),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
