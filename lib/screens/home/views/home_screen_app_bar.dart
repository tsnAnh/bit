import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../blocs/user/user_cubit.dart';
import '../../../common/extensions/extensions.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/bit_circular_progress_bar.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
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

class _AvatarCircularProgress extends StatelessWidget {
  const _AvatarCircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
