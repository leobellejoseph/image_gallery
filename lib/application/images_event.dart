part of 'images_bloc.dart';

@freezed
class ImagesEvent with _$ImagesEvent {
  const factory ImagesEvent.initialize() = _Initialize;
  const factory ImagesEvent.fetchImages() = _FetchImages;
}