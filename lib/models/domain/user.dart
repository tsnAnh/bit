import 'package:equatable/equatable.dart';

import '../dtos/user_dto.dart';

class User extends Equatable {
  final String id, username, name, url, imageUrl;

  const User(this.id, this.username, this.name, this.url, this.imageUrl);

  @override
  List<Object?> get props => [id, username, name, url, imageUrl];

  factory User.fromDTO(UserJson dto) => User(dto.id, dto.username, dto.name, dto.url, dto.imageUrl);
}
