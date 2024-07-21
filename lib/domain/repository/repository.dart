import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_gallery/domain/dto/image_info_dto.dart';
import 'package:image_gallery/domain/entity/image_object.dart';
import 'package:dio/dio.dart';

class ImagesRepository {
  final Dio _dio;
  ImagesRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<ImageObject>> fetchImages(
      {int startIndex = 1, int pageSize = 10}) async {
    final query = {'page': startIndex, 'limit': pageSize};
    final response =
        await _dio.get('https://picsum.photos/v2/list', queryParameters: query);
    if (response.statusCode == 200) {
      final data = (response.data as List)
          .map((item) => ImageInfoDto.fromJson(item))
          .toList();

      return data
          .map((item) => ImageObject.toDomain(imageInfoDto: item))
          .toList();
    }
    return <ImageObject>[];
  }

  Future<List<ImageObject>> fetchOfflineImages(
      {int startIndex = 1, int pageSize = 10}) async {
    final box = await Hive.openBox('ImageGallery');
    if (box.isOpen) {
      final list =
          box.toMap().entries.map((item) => item as ImageObject).toList();
      if (list.isNotEmpty) {
        return list;
      }
      box.close();
    }
    return <ImageObject>[];
  }

  Future<void> saveOfflineImageObject({required ImageObject image}) async {
    final box = await Hive.openBox('ImageGallery');
    if (box.isOpen) {
      box.put(image.id, image);
      print('Saved:${box.toMap().entries.length}');
      box.close();
    }
  }
}
