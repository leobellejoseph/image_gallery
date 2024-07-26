part of 'images_bloc.dart';

abstract class ImagesEvent {}

class InitialImagesEvent extends ImagesEvent {}

class FetchImagesEvent extends ImagesEvent {
  final int startIndex;
  final int pageSize;
  FetchImagesEvent({int? startIndex, int? size})
      : startIndex = startIndex ?? 1,
        pageSize = size ?? 10;
}

class SaveImagesEvent extends ImagesEvent {
  final ImageInfoObject image;
  SaveImagesEvent({required this.image});
}
