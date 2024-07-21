import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery/application/images_bloc.dart';
import 'package:image_gallery/domain/entity/image_object.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.get_app,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            context.read<ImagesBloc>().add(FetchImagesEvent());
          },
        ),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.lightBlue,
        ),
        child: BlocBuilder<ImagesBloc, ImagesState>(
          builder: (context, state) {
            print('STATUS:${state.status}');
            if (state.status == EventStatus.fetching) {
              return const Center(child: CircularProgressIndicator());
            }
            final list = state.images;
            return ListView.separated(
              itemCount: list.length,
              itemBuilder: (context, index) => _itemBuilder(image: list[index]),
              separatorBuilder: (context, index) => _separatorBuilder(),
            );
          },
        ),
      ),
    );
  }

  Widget _itemBuilder({required ImageObject image}) {
    return const ListTile();
  }

  Widget _separatorBuilder() {
    return const Divider(
      height: 0.5,
      thickness: 0.5,
      color: Colors.black54,
    );
  }
}