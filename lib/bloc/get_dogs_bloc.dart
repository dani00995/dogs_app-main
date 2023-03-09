
import 'package:dogs/bloc/animal_event.dart';
import 'package:dogs/bloc/animal_state.dart';
import 'package:dogs/repo/animals_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class GetDogsBloc extends Bloc<AnimalEvent, AnimalState> {
  GetDogsBloc({required this.repo}) : super(AnimalInitial()) {
    on<GetAnimalEvent>(
      (event, emit) async {
        try {
          emit(
            AnimalSuccess(
              model: await repo.getDogsData(
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
