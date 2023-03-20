

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:menyou_backend/repository/command_repository.dart';

import '../models/command.dart';
import '../utils/local_storage.dart';

class CommandController{

  final _commandRepo = Get.put(CommandRepository());

  Future<void> createCommande() async{
    return _commandRepo.createCommand();
  }
}