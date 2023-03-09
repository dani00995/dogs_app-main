import 'package:dio/dio.dart';
import 'package:dogs/core_data/dio_settings.dart';
import 'package:dogs/models/all_models.dart';

class AnimalsRepository {
  final DioSettings dioSettings;
  AnimalsRepository({required this.dioSettings});

  Future<DogsModel> getDogsData({required int count}) async {
    final response = await dioSettings.dio.get('$count');
    return DogsModel.fromJson(response.data);
  }

  Future<CatsModel> getCatsData({required int count}) async {
    print("======================= {response.data['file']} ======================");
    final response = await dioSettings.dioCat.get('meow');
    return CatsModel.fromJson(response.data);
  }
}

