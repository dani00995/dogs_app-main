import 'package:bloc/bloc.dart';
import 'package:dogs/models/all_models.dart';
import 'package:dogs/repo/animals_repository.dart';
import 'package:meta/meta.dart';

part 'animal_event.dart';
part 'animal_state.dart';

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
