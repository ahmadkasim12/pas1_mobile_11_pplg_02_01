import 'package:get/get.dart';
import 'package:pas1_mobile_11_pplg_02_01/api/sport_api/SportApiService.dart';
import 'package:pas1_mobile_11_pplg_02_01/api/sport_api/SportModel.dart';

class SportController extends GetxController {
  var teams = <Team>[].obs;

  Future<void> fetchData () async{
    var fetchedData = await SportApiService().fetchData();
    teams.assignAll(fetchedData);
  }
}