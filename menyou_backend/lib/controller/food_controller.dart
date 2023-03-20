import 'package:get/get.dart';
import 'package:menyou_backend/models/Food.dart';
import 'package:menyou_backend/repository/food_repository.dart';
import 'package:menyou_backend/utils/local_storage.dart';


class FoodController extends GetxController{

  final _foodRepo = Get.put(FoodRepository());

  Future<List<Food>> getFoodsByResto(String restaurantId) async{
    return await _foodRepo.getFoodsByResto(restaurantId);
  }

  Future<Food> getfoodDetails(String foodId) async{
    return await _foodRepo.getFoodDetails(foodId);
  }

}