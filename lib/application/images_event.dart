part of 'images_bloc.dart';

abstract class ImagesEvent {}

class InitialImagesEvent extends ImagesEvent {}

class FetchImagesEvent extends ImagesEvent {
  final int pageSize;
  FetchImagesEvent({int? size}) : pageSize = size ?? 10;
}