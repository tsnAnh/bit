import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user/user_cubit.dart';
import '../../../common/extensions/extensions.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/bit_circular_progress_bar.dart';
import '../../../widgets/error/bit_error_widget.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        context.l10n.text_bit,
        style: context.textTheme.headline6?.copyWith(
          color: context.theme.brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
      actions: [
        BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserFetched) {
              return _UserAvatar(imageUrl: state.user.imageUrl);
            } else if (state is UserNotFetched) {
              return BitErrorWidget(error: state.error);
            }

            return const BitCircularProgressBar();
          },
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .75,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
