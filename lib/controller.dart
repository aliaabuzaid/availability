import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Controller extends GetxController
{
  RxString initDrop1="Shelf".obs;
  RxString initDrop2="Category".obs;
  RxString initDrop3="Product".obs;
  RxList isSelectCat=[false,false,false].obs;
  RxList isSelectCat2=[false,false,false].obs;
}