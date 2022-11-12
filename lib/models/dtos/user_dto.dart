import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';

part 'user_dto.g.dart';

@freezed
class UserJson with _$UserJson {
  const factory UserJson({
    required String id,
    required String username,
    required String name,
    required String url,
    required String imageUrl,
  }) = _UserJson;

  factory UserJson.fromJson(Map<String, Object?> json) =>
      _$UserJsonFromJson(json);
}

@freezed
class UserJsonWrapper with _$UserJsonWrapper {
  const factory UserJsonWrapper({
    required UserJson data,
  }) = _UserJsonWrapper;

  factory UserJsonWrapper.fromJson(Map<String, Object?> json) =>
      _$UserJsonWrapperFromJson(json);
}
