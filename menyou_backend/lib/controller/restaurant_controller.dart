import 'package:get/get.dart';
import 'package:menyou_backend/models/restaurant.dart';
import 'package:menyou_backend/repository/restaurant_repository.dart';

class RestaurantController extends GetxController{

  final _restaurantRepo = Get.put(RestaurantRepository());

  Future<List<Restaurant>> getAllRestaurants() async{
    return await _restaurantRepo.allRestaurants();
  }
}