import 'package:get/get.dart';

class NavBarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeMenuTo(int index){
    selectedIndex.value = index;
  }
}