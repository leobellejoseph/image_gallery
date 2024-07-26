import 'package:flutter/material.dart';
import 'package:image_gallery/domain/dto/image_info_dto.dart';

class ImageInfoObject {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String downloadUrl;
  final bool isSavedOffline;
  final Image image;
  final String imageString;
  const ImageInfoObject({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
    required this.isSavedOffline,
    required this.image,
    required this.imageString,
  });

  factory ImageInfoObject.empty() => const ImageInfoObject(
        id: '',
        author: '',
        width: 0,
        height: 0,
        url: '',
        downloadUrl: '',
        isSavedOffline: false,
        image: Image(image: AssetImage('assets/no_image.png')),
        imageString: '',
      );

  factory ImageInfoObject.toDomain({
    required ImageInfoDto imageInfoDto,
    bool isSavedOffline = false,
  }) {
    final image = Image(image: NetworkImage(imageInfoDto.downloadUrl));

    return ImageInfoObject(
      id: imageInfoDto.id,
      author: imageInfoDto.author,
      width: imageInfoDto.width,
      height: imageInfoDto.height,
      url: imageInfoDto.url,
      downloadUrl: imageInfoDto.downloadUrl,
      isSavedOffline: isSavedOffline,
      image: image,
      imageString: imageInfoDto.imageString,
    );
  }

  

  dynamic toJson() {
    final json = {
      'id': id,
      'author': author,
      'width': width,
      'height': height,
      'url': url,
      'download_url': downloadUrl,
      'imageString': imageString,
    };
    return json;
  }

  ImageInfoObject copyWith({
    String? id,
    String? author,
    int? width,
    int? height,
    String? url,
    String? downloadUrl,
    bool? isSavedOffline,
    String? imageString,
    Image? image,
  }) =>
      ImageInfoObject(
        id: id ?? this.id,
        author: author ?? this.author,
        width: width ?? this.width,
        height: height ?? this.height,
        url: url ?? this.url,
        downloadUrl: downloadUrl ?? this.url,
        isSavedOffline: isSavedOffline ?? this.isSavedOffline,
        image: image ?? this.image,
        imageString: imageString ?? this.imageString,
      );
}
