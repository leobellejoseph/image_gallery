import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery/application/images_bloc.dart';
import 'package:image_gallery/domain/entity/image_info_object.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  final bool hasInternet;
  const HomeScreen({super.key, required this.hasInternet});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _controller;
  final _scrollController = ScrollController();
  final RegExp _numberRegExp = RegExp(r'^\d+$');
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _controller = TextEditingController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusNode().unfocus,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              readOnly: !widget.hasInternet,
              controller: _controller,
              focusNode: _focusNode,
              onFieldSubmitted: (value) {
                if (_numberRegExp.hasMatch(value)) {
                  context.read<ImagesBloc>().add(FetchImagesEvent(size: int.tryParse(value) ?? 0));
                } else {
                  if (value.isNotEmpty) {
                    _showBannerNotification(message: 'Invalid Value. Please try again');
                  } else {
                    context.read<ImagesBloc>().add(InitialImagesEvent());
                  }
                }
              },
              cursorColor: Colors.black,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Enter Page Size',
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 10,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: RefreshIndicator(
            onRefresh: () async {
              _focusNode.unfocus();
              await Future.delayed(const Duration(seconds: 1));
              if (mounted) {
                context.read<ImagesBloc>().add(FetchImagesEvent());
              }
            },
            child: SafeArea(
              top: false,
              bottom: true,
              child: BlocBuilder<ImagesBloc, ImagesState>(
                builder: (context, state) {
                  if (state.images.isEmpty) {
                    return Center(
                      child: Lottie.asset(
                        'assets/loading_splash.json',
                        repeat: true,
                      ),
                    );
                  }

                  final list = state.images;
                  return ListView.separated(
                    controller: _scrollController,
                    itemCount: list.length,
                    itemBuilder: (context, index) => _itemBuilder(image: list[index], index: index + 1),
                    separatorBuilder: (context, index) => _separatorBuilder(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder({required ImageInfoObject image, required int index}) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: image.isSavedOffline && image.imageString.isNotEmpty
                  ? Image(
                      image: MemoryImage(
                        base64Decode(image.imageString),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: image.downloadUrl,
                      errorWidget: (context, value, obj) =>
                          const Center(child: Image(image: AssetImage('assets/no_image.png'))),
                      placeholder: (context, value) => Center(
                        child: Lottie.asset('assets/loading.json'),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Opacity(
                  opacity: 0.7,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      index.toString(),
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                  opacity: 0.7,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      splashColor: Colors.blueAccent,
                      onPressed: image.isSavedOffline
                          ? null
                          : () {
                              context.read<ImagesBloc>().add(SaveImagesEvent(image: image));
                              _showBannerNotification(
                                  message: 'Image[]${image.id}] Saved Successfully.', isWarning: false);
                            },
                      icon: image.isSavedOffline
                          ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.download,
                              color: Colors.blueAccent,
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _separatorBuilder() {
    return const Divider(
      height: 0.5,
      thickness: 0.5,
      color: Colors.black54,
    );
  }

  void _showBannerNotification({required String message, bool isWarning = true}) {
    final banner = MaterialBanner(
      content: Text(message, style: TextStyle(color: isWarning ? Colors.red : Colors.green)),
      actions: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.blue)),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              _controller.clear();
            },
            child: const Text('Close', style: TextStyle(color: Colors.blue)))
      ],
    );
    ScaffoldMessenger.of(context).showMaterialBanner(banner);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() async {
    final length = context.read<ImagesBloc>().state.images.length;
    if (_isBottom && _controller.value.text.isEmpty) {
      context.read<ImagesBloc>().add(FetchImagesEvent(size: length + 10));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}