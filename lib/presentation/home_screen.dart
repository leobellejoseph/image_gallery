import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery/application/images_bloc.dart';
import 'package:image_gallery/domain/entity/image_info_object.dart';

class HomeScreen extends StatefulWidget {
  final bool hasInternet;
  const HomeScreen({super.key, required this.hasInternet});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController controller;
  final _scrollController = ScrollController();
  final RegExp numberRegExp = RegExp(r'^\d+$');
  @override
  void initState() {
    controller = TextEditingController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusNode().unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: TextFormField(
            readOnly: !widget.hasInternet,
            controller: controller,
            onFieldSubmitted: (value) {
              if (numberRegExp.hasMatch(value)) {
                context
                    .read<ImagesBloc>()
                    .add(FetchImagesEvent(size: int.tryParse(value) ?? 0));
              } else {
                if (value.isNotEmpty) {
                  final banner = MaterialBanner(
                    content: const Text('Invalid Value. Please try again',
                        style: TextStyle(color: Colors.red)),
                    actions: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.blue)),
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                            controller.clear();
                          },
                          child: const Text('Close',
                              style: TextStyle(color: Colors.blue)))
                    ],
                  );
                  ScaffoldMessenger.of(context).showMaterialBanner(banner);
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
              contentPadding: const EdgeInsets.all(4),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1,
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
        body: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));
              if (mounted) {
                context.read<ImagesBloc>().add(FetchImagesEvent());
                FocusNode().unfocus();
              }
            },
            child: BlocBuilder<ImagesBloc, ImagesState>(
              builder: (context, state) {
                if (state.images.isEmpty) {
                  return const Center(
                    child: Text('No Data'),
                  );
                }

                final list = state.images;
                return ListView.separated(
                  controller: _scrollController,
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      _itemBuilder(image: list[index], index: index + 1),
                  separatorBuilder: (context, index) => _separatorBuilder(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder({required ImageInfoObject image, required int index}) {
    return ListTile(
      title: Stack(
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
                        const Image(image: AssetImage('assets/no_image.png')),
                    placeholder: (context, value) => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                index.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              splashColor: Colors.white,
              onPressed: image.isSavedOffline
                  ? null
                  : () {
                      context
                          .read<ImagesBloc>()
                          .add(SaveImagesEvent(image: image));
                    },
              icon: image.isSavedOffline
                  ? const Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.download,
                      color: Colors.white,
                    ),
            ),
          ),
        ],
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

  @override
  void dispose() {
    controller.dispose();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() async {
    final length = context.read<ImagesBloc>().state.images.length;
    if (_isBottom && controller.value.text.isEmpty) {
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
