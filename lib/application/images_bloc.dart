import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_gallery/domain/entity/image_object.dart';
import 'package:image_gallery/domain/repository/repository.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final ImagesRepository _repository;

  ImagesBloc({ImagesRepository? repository})
      : _repository = repository ?? ImagesRepository(),
        super(ImagesState.initial()) {
    on<InitialImagesEvent>(_initialize);
    on<FetchImagesEvent>(_fetchImages);
  }

  Future<void> _initialize(InitialImagesEvent event, Emitter<ImagesState> emit) async {
    emit(state.copyWith(status: EventStatus.fetching));
    final imageList = await _repository.fetchImages();
    emit(state.copyWith(images: imageList, status: EventStatus.fetched));
  }

  Future<void> _fetchImages(FetchImagesEvent event, Emitter<ImagesState> emit) async {
    emit(state.copyWith(status: EventStatus.fetching));
    final imageList = await _repository.fetchImages();
    emit(state.copyWith(images: imageList, status: EventStatus.fetched));
  }
}