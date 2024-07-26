import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_gallery/constants.dart';
import 'package:image_gallery/domain/dto/image_info_dto.dart';
import 'package:image_gallery/domain/entity/image_info_object.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ImagesRepository {
  final Dio dio;

  ImagesRepository({required this.dio});

  Future<List<ImageInfoObject>> fetchImagesRemote(
      {int startIndex = 1, int pageSize = 10}) async {
    final query = {'page': startIndex, 'limit': pageSize};
    final response =
        await dio.get(ValueObjects.IMAGE_GALLERY_URL, queryParameters: query);
    if (response.statusCode == 200) {
      final data = (response.data as List)
          .map((item) => ImageInfoDto.fromJson(item))
          .toList();
      final box = await Hive.openBox(ValueObjects.IMAGE_GALLERY);
      return data
          .map(
            (item) => ImageInfoObject.toDomain(
              imageInfoDto: item,
              isSavedOffline: box.isNotEmpty && box.containsKey(item.id),
            ),
          )
          .toList();
    }

    return <ImageInfoObject>[];
  }

  Future<List<ImageInfoObject>> fetchImagesLocal(
      {int startIndex = 1, int pageSize = 10}) async {
    final box = await Hive.openBox(ValueObjects.IMAGE_GALLERY);
    if (box.isNotEmpty) {
      final list = box.values
          .map((item) => ImageInfoDto.fromJson(jsonDecode(item)))
          .toList();
      return list.map((item) {
        return ImageInfoObject.toDomain(
            imageInfoDto: item, isSavedOffline: true);
      }).toList();
    }

    return <ImageInfoObject>[];
  }

  Future<String> saveOfflineImageObject(
      {required ImageInfoObject image}) async {
    final box = await Hive.openBox(ValueObjects.IMAGE_GALLERY);
    final response = await http.get(Uri.parse(image.downloadUrl));
    final base64 = base64Encode(response.bodyBytes);
    final data = image.copyWith(imageString: base64).toJson();
    final json = jsonEncode(data);
    if (box.isOpen && !box.containsKey(image.id)) {
      box.put(image.id, json);
    }
    return base64;
  }
}
