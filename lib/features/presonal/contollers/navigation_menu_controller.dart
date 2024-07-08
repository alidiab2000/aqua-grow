   import 'package:get/get.dart';

 
class NavigationMenuController extends GetxController {
  static NavigationMenuController get instance => Get.find();
  final selectedIndex = 0.obs;
  void chanageselectedIndex(int index) => selectedIndex.value = index;
  //TODO
  final screens = [
  
  ];
}