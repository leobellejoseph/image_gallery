// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageInfoDto _$ImageInfoDtoFromJson(Map<String, dynamic> json) => ImageInfoDto(
      id: json['id'] as String,
      author: json['author'] as String,
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      url: json['url'] as String,
      download_url: json['download_url'] as String,
    );

Map<String, dynamic> _$ImageInfoDtoToJson(ImageInfoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'download_url': instance.download_url,
    };
