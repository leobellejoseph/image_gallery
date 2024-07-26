import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_gallery/application/images_bloc.dart';
import 'package:image_gallery/domain/repository/repository.dart';
import 'package:image_gallery/presentation/home_screen.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hasInternet = await InternetConnection().hasInternetAccess;
  final dir = await getApplicationDocumentsDirectory();
  final repository = ImagesRepository(dio: Dio());
  await Hive.initFlutter(dir.path);
  runApp(MainApp(repository: repository, hasInternet: hasInternet));
}

class MainApp extends StatelessWidget {
  final ImagesRepository repository;
  final bool hasInternet;
  const MainApp(
      {super.key, required this.repository, required this.hasInternet});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) =>
            ImagesBloc(repository: repository, hasInternet: hasInternet)
              ..add(InitialImagesEvent()),
        child: const HomeScreen(),
      ),
    );
  }
}
