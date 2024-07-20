import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'images_event.dart';
part 'images_state.dart';
part 'images_bloc.freezed.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc() : super(ImagesState.initial()) {
    on<ImagesEvent>((event, emit) {});
  }
}