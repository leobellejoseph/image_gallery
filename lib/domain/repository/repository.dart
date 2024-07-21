import 'dart:convert';

import 'package:image_gallery/domain/dto/image_info_dto.dart';
import 'package:image_gallery/domain/entity/image_object.dart';
import 'package:dio/dio.dart';

class ImagesRepository {
  final Dio _dio;
  ImagesRepository({Dio? dio}) : _dio = dio ?? Dio();
  Future<List<ImageObject>> fetchImages({int pageSize = 10}) async {
    final response = await _dio.get('https://picsum.photos/v2/list');
    print('RESPONSE:${response.data.toString()}');
    final json = jsonDecode(response.data);
    final data = (json as List<ImageInfoDto>);
    print(data);
    return <ImageObject>[];
  }
}