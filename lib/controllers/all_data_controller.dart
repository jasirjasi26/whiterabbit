import 'package:flutter_app_white_rabbit/models/all_data.dart';
import 'package:flutter_app_white_rabbit/services/all_data_service.dart';
import 'package:get/get.dart';

class AllDataController extends GetxController{
  var allData = <AllData>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  void fetchAllData() async {
    try {
      //isLoading(true);
      var productsList = await AllDataService.fetchAllData();
      if (productsList != null) {
        allData.value = productsList;
      }
    } finally {
     // isLoading(false);
    }
  }

}