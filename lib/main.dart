import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery/application/images_bloc.dart';
import 'package:image_gallery/domain/repository/repository.dart';
import 'package:image_gallery/presentation/home_screen.dart';

void main() {
  final repository = ImagesRepository(dio: Dio());
  runApp(MainApp(repository: repository));
}

class MainApp extends StatelessWidget {
  final ImagesRepository repository;

  const MainApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ImagesBloc(repository: repository),
        child: const HomeScreen(),
      ),
    );
  }
}