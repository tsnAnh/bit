import 'package:flutter/material.dart';

import '../../common/error.dart';
import 'bad_request_widget.dart';
import 'forbidden_widget.dart';
import 'internal_server_error_widget.dart';
import 'not_found_widget.dart';
import 'timeout_widget.dart';
import 'unauthorized_widget.dart';
import 'unknown_widget.dart';

class BitErrorWidget extends StatelessWidget {
  const BitErrorWidget({Key? key, required this.error}) : super(key: key);

  final DataSourceError error;

  @override
  Widget build(BuildContext context) {
    if (error is NotFound) {
      return const NotFoundWidget();
    } else if (error is InternalServerError) {
      return const InternalServerErrorWidget();
    } else if (error is Unauthorized) {
      return const UnauthorizedWidget();
    } else if (error is BadRequest) {
      return const BadRequestWidget();
    } else if (error is Timeout) {
      return const TimeoutWidget();
    } else if (error is Forbidden) {
      return const ForbiddenWidget();
    } else {
      return const UnknownWidget();
    }
  }
}
