part of 'get_dogs_bloc.dart';

@immutable
abstract class AnimalEvent {}

class GetAnimalEvent extends AnimalEvent {
  final int count;
  GetAnimalEvent({required this.count});
}
