import 'package:dogs/bloc/get_cats_bloc.dart';
import 'package:dogs/bloc/get_dogs_bloc.dart';
import 'package:dogs/core_data/dio_settings.dart';
import 'package:dogs/repo/animals_repository.dart';
import 'package:dogs/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => AnimalsRepository(
              dioSettings: RepositoryProvider.of<DioSettings>(context)),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetDogsBloc(
              repo: RepositoryProvider.of<AnimalsRepository>(
                context,
              ),
            ),
          ),
          BlocProvider(
            create: (context) => GetCatsBloc(
              repo: RepositoryProvider.of<AnimalsRepository>(
                context,
              ),
            ),
          ),
        ],
        child: const MaterialApp(
          home: HomePageScreen(),
        ),
      ),
    );
  }
}
