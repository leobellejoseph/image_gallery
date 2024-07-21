part of 'images_bloc.dart';

enum EventStatus {
  fetching,
  fetched,
  failure;
}

class ImagesState {
  final List<ImageObject> images;
  final EventStatus status;
  final bool hasReachedMaxPage;
  const ImagesState({
    required this.images,
    required this.status,
    required this.hasReachedMaxPage,
  });
  factory ImagesState.initial() => const ImagesState(
        status: EventStatus.fetching,
        images: [],
        hasReachedMaxPage: false,
      );

  ImagesState copyWith({
    List<ImageObject>? images,
    EventStatus? status,
    bool? hasReachedMaxPage,
  }) =>
      ImagesState(
        images: images ?? this.images,
        status: status ?? this.status,
        hasReachedMaxPage: hasReachedMaxPage ?? this.hasReachedMaxPage,
      );
}
