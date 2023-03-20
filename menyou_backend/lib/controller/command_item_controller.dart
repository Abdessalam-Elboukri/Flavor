import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menyou_backend/models/command_items.dart';
import 'package:menyou_backend/models/local_data.dart';
import 'package:menyou_backend/repository/food_repository.dart';

import '../models/Food.dart';
import '../repository/command_items_repository.dart';


class CommandItemController extends GetxController{

  final _commandItemRepo = Get.put(CommandItemsRepository());
  final _foodRepo = Get.put(FoodRepository());

  Future<List<LocalFood>> getAllItems() async {
    List<LocalFood> foodItemsList = [];
    List<CommandItems> commandItems = await _commandItemRepo.getAllitems();

    for (CommandItems item in commandItems) {
      Food food = await _foodRepo.getFoodDetails(item.foodId);
      LocalFood data= LocalFood(id: food.id, category: food.category, name: food.name, image: food.image, price: food.price, quantity:item.quantity);
      foodItemsList.add(data);
    }
    print(foodItemsList.length);
    return foodItemsList;
  }
}