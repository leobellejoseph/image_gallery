import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery/domain/entity/image_info_object.dart';
import 'package:image_gallery/domain/repository/repository.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final ImagesRepository repository;
  final bool hasInternet;
  ImagesBloc({required this.repository, required this.hasInternet})
      : super(ImagesState.initial()) {
    on<InitialImagesEvent>(_initialize);
    on<FetchImagesEvent>(_fetchImages);
    on<SaveImagesEvent>(_saveImage);
  }

  Future<void> _initialize(
      InitialImagesEvent event, Emitter<ImagesState> emit) async {
    emit(state.copyWith(status: EventStatus.fetching));
    List<ImageInfoObject> imageList = [];
    if (hasInternet) {
      imageList =
          await repository.fetchImagesRemote(startIndex: 0, pageSize: 10);
    } else {
      imageList =
          await repository.fetchImagesLocal(startIndex: 0, pageSize: 10);
    }
    emit(state.copyWith(images: imageList, status: EventStatus.fetched));
  }

  Future<void> _fetchImages(
      FetchImagesEvent event, Emitter<ImagesState> emit) async {
    if (state.hasReachedMaxPage || !hasInternet) return;

    emit(state.copyWith(status: EventStatus.fetching));

    List<ImageInfoObject> imageList = [];

    imageList = await repository.fetchImagesRemote(
        startIndex: event.startIndex, pageSize: event.pageSize);

    if (imageList.isEmpty) {
      emit(
          state.copyWith(hasReachedMaxPage: true, status: EventStatus.fetched));
    }
    emit(state.copyWith(images: imageList, status: EventStatus.fetched));
  }

  Future<void> _saveImage(
      SaveImagesEvent event, Emitter<ImagesState> emit) async {
    if (state.hasReachedMaxPage) return;
    emit(state.copyWith(status: EventStatus.fetching));
    final base64 = await repository.saveOfflineImageObject(image: event.image);
    final list = state.images
        .map((item) => event.image.id == item.id
            ? event.image.copyWith(isSavedOffline: true, imageString: base64)
            : item)
        .toList();
    emit(state.copyWith(images: list, status: EventStatus.fetched));
  }
}
