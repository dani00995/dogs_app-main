
import 'package:dogs/models/all_models.dart';

abstract class AnimalState {}

class AnimalInitial extends AnimalState {}

class AnimalSuccess extends AnimalState {
  final DogsModel? model;
  final CatsModel? modelCat;
  AnimalSuccess({this.model, this.modelCat});
}

class AnimalError extends AnimalState {}
