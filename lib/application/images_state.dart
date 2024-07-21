part of 'images_bloc.dart';

enum EventStatus {
  fetching,
  fetched,
  failure;
}

class ImagesState {
  final List<ImageObject> images;
  final EventStatus status;
  const ImagesState({
    required this.images,
    required this.status,
  });
  factory ImagesState.initial() => const ImagesState(
        status: EventStatus.fetching,
        images: [],
      );

  ImagesState copyWith({List<ImageObject>? images, EventStatus? status}) => ImagesState(
        images: images ?? this.images,
        status: status ?? this.status,
      );
}