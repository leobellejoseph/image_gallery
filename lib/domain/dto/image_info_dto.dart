import 'package:json_annotation/json_annotation.dart';

part 'image_info_dto.g.dart';

@JsonSerializable()
class ImageInfoDto {
  final String id;
  final String author;
  final double width;
  final double height;
  final String url;
  final String download_url;
  const ImageInfoDto({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.download_url,
  });
}