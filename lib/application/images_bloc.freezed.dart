// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'images_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImagesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() fetchImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? fetchImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? fetchImages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchImages value) fetchImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchImages value)? fetchImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchImages value)? fetchImages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesEventCopyWith<$Res> {
  factory $ImagesEventCopyWith(
          ImagesEvent value, $Res Function(ImagesEvent) then) =
      _$ImagesEventCopyWithImpl<$Res, ImagesEvent>;
}

/// @nodoc
class _$ImagesEventCopyWithImpl<$Res, $Val extends ImagesEvent>
    implements $ImagesEventCopyWith<$Res> {
  _$ImagesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$ImagesEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'ImagesEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() fetchImages,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? fetchImages,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? fetchImages,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchImages value) fetchImages,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchImages value)? fetchImages,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchImages value)? fetchImages,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ImagesEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$FetchImagesImplCopyWith<$Res> {
  factory _$$FetchImagesImplCopyWith(
          _$FetchImagesImpl value, $Res Function(_$FetchImagesImpl) then) =
      __$$FetchImagesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImagesImplCopyWithImpl<$Res>
    extends _$ImagesEventCopyWithImpl<$Res, _$FetchImagesImpl>
    implements _$$FetchImagesImplCopyWith<$Res> {
  __$$FetchImagesImplCopyWithImpl(
      _$FetchImagesImpl _value, $Res Function(_$FetchImagesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchImagesImpl implements _FetchImages {
  const _$FetchImagesImpl();

  @override
  String toString() {
    return 'ImagesEvent.fetchImages()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImagesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() fetchImages,
  }) {
    return fetchImages();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? fetchImages,
  }) {
    return fetchImages?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? fetchImages,
    required TResult orElse(),
  }) {
    if (fetchImages != null) {
      return fetchImages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchImages value) fetchImages,
  }) {
    return fetchImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchImages value)? fetchImages,
  }) {
    return fetchImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchImages value)? fetchImages,
    required TResult orElse(),
  }) {
    if (fetchImages != null) {
      return fetchImages(this);
    }
    return orElse();
  }
}

abstract class _FetchImages implements ImagesEvent {
  const factory _FetchImages() = _$FetchImagesImpl;
}

/// @nodoc
mixin _$ImagesState {
  String get id => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get downloadUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImagesStateCopyWith<ImagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesStateCopyWith<$Res> {
  factory $ImagesStateCopyWith(
          ImagesState value, $Res Function(ImagesState) then) =
      _$ImagesStateCopyWithImpl<$Res, ImagesState>;
  @useResult
  $Res call(
      {String id,
      String author,
      double width,
      double height,
      String url,
      String downloadUrl});
}

/// @nodoc
class _$ImagesStateCopyWithImpl<$Res, $Val extends ImagesState>
    implements $ImagesStateCopyWith<$Res> {
  _$ImagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? width = null,
    Object? height = null,
    Object? url = null,
    Object? downloadUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImagesStateImplCopyWith<$Res>
    implements $ImagesStateCopyWith<$Res> {
  factory _$$ImagesStateImplCopyWith(
          _$ImagesStateImpl value, $Res Function(_$ImagesStateImpl) then) =
      __$$ImagesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String author,
      double width,
      double height,
      String url,
      String downloadUrl});
}

/// @nodoc
class __$$ImagesStateImplCopyWithImpl<$Res>
    extends _$ImagesStateCopyWithImpl<$Res, _$ImagesStateImpl>
    implements _$$ImagesStateImplCopyWith<$Res> {
  __$$ImagesStateImplCopyWithImpl(
      _$ImagesStateImpl _value, $Res Function(_$ImagesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? width = null,
    Object? height = null,
    Object? url = null,
    Object? downloadUrl = null,
  }) {
    return _then(_$ImagesStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImagesStateImpl implements _ImagesState {
  const _$ImagesStateImpl(
      {required this.id,
      required this.author,
      required this.width,
      required this.height,
      required this.url,
      required this.downloadUrl});

  @override
  final String id;
  @override
  final String author;
  @override
  final double width;
  @override
  final double height;
  @override
  final String url;
  @override
  final String downloadUrl;

  @override
  String toString() {
    return 'ImagesState(id: $id, author: $author, width: $width, height: $height, url: $url, downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, author, width, height, url, downloadUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesStateImplCopyWith<_$ImagesStateImpl> get copyWith =>
      __$$ImagesStateImplCopyWithImpl<_$ImagesStateImpl>(this, _$identity);
}

abstract class _ImagesState implements ImagesState {
  const factory _ImagesState(
      {required final String id,
      required final String author,
      required final double width,
      required final double height,
      required final String url,
      required final String downloadUrl}) = _$ImagesStateImpl;

  @override
  String get id;
  @override
  String get author;
  @override
  double get width;
  @override
  double get height;
  @override
  String get url;
  @override
  String get downloadUrl;
  @override
  @JsonKey(ignore: true)
  _$$ImagesStateImplCopyWith<_$ImagesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
