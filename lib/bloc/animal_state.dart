part of 'get_dogs_bloc.dart';

@immutable
abstract class AnimalState {}

class AnimalInitial extends AnimalState {}

class AnimalSuccess extends AnimalState {
  final DogsModel? model;
  final CatsModel? modelCat;
  AnimalSuccess({this.model, this.modelCat});
}

class AnimalError extends AnimalState {}
