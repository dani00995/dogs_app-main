

import 'package:dogs/bloc/get_dogs_bloc.dart';
import 'package:dogs/repo/animals_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCatsBloc extends Bloc<AnimalEvent, AnimalState> {
  GetCatsBloc({required this.repo}) : super(AnimalInitial()) {
    on<GetAnimalEvent>(
      (event, emit) async {
        try {
          emit(
            AnimalSuccess(
              modelCat: await repo.getCatsData(
                count: event.count,
              ),
            ),
          );
        } catch (e) {
          emit(AnimalError());
        }
      },
    );
  }
  final AnimalsRepository repo;
}
