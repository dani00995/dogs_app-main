
abstract class AnimalEvent {}

class GetAnimalEvent extends AnimalEvent {
  final int count;
  GetAnimalEvent({required this.count});
}
