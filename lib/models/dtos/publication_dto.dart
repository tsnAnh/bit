import 'package:freezed_annotation/freezed_annotation.dart';

part 'publication_dto.freezed.dart';

part 'publication_dto.g.dart';

@freezed
class PublicationJson with _$PublicationJson {
  const factory PublicationJson({
    required String id,
    required String name,
    required String description,
    required String url,
    required String imageUrl,
  }) = _PublicationJson;

  factory PublicationJson.fromJson(Map<String, Object?> json) =>
      _$PublicationJsonFromJson(json);
}

@freezed
class PublicationJsonWrapper with _$PublicationJsonWrapper {
  const factory PublicationJsonWrapper({
    required List<PublicationJson> data,
  }) = _PublicationJsonWrapper;

  factory PublicationJsonWrapper.fromJson(Map<String, Object?> json) =>
      _$PublicationJsonWrapperFromJson(json);
}
