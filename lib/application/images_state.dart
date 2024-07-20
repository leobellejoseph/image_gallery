part of 'images_bloc.dart';

@freezed
class ImagesState with _$ImagesState {
  const factory ImagesState({
    required String id,
    required String author,
    required double width,
    required double height,
    required String url,
    required String downloadUrl,
  }) = _ImagesState;
  factory ImagesState.initial() => const ImagesState(
        id: "",
        author: "",
        width: 0,
        height: 0,
        url: "",
        downloadUrl: "",
      );
}