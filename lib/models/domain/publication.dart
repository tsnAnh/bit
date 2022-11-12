import 'package:equatable/equatable.dart';

import '../dtos/publication_dto.dart';

class Publication extends Equatable {
  final String id, name, description, url, imageUrl;

  const Publication(
    this.id,
    this.name,
    this.description,
    this.url,
    this.imageUrl,
  );

  @override
  List<Object?> get props => [id, name, description, url, imageUrl];

  factory Publication.fromDTO(PublicationJson json) => Publication(
        json.id,
        json.name,
        json.description,
        json.url,
        json.imageUrl,
      );

  PublicationJson asDTO() => PublicationJson(
        id: id,
        name: name,
        description: description,
        url: url,
        imageUrl: imageUrl,
      );
}
