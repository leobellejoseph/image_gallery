import 'package:image_gallery/domain/dto/image_info_dto.dart';

class ImageObject {
  final String id;
  final String author;
  final double width;
  final double height;
  final String url;
  final String downloadUrl;
  const ImageObject({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

  factory ImageObject.toDomain({required ImageInfoDto imageInfoDto}) {
    return ImageObject(
      id: imageInfoDto.id,
      author: imageInfoDto.author,
      width: imageInfoDto.width,
      height: imageInfoDto.height,
      url: imageInfoDto.url,
      downloadUrl: imageInfoDto.download_url,
    );
  }
}