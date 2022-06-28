import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter_app_white_rabbit/models/all_data.dart';
import 'package:http/http.dart' as http;
class AllDataService{
  static var client=http.Client();

  static Future<List<AllData>?> fetchAllData() async{

     bool apiData = await APICacheManager().isAPICacheKeyExist("AllData");

     if(apiData){
       print("Data exists in cache");
       var cacheData = await APICacheManager().getCacheData("AllData");

       return allDataFromJson(jsonDecode(cacheData.syncData.toString()));
     }else{
       print("Data Not exists");
       var response = await client.get(Uri.parse(
           'http://www.mocky.io/v2/5d565297300000680030a986'));
       if (response.statusCode == 200) {
         var jsonString = response.body;
         APICacheDBModel cacheDBModel =
         APICacheDBModel(key: "AllData", syncData: jsonEncode(jsonString));
         await APICacheManager().addCacheData(cacheDBModel);

         var cacheData = await APICacheManager().getCacheData("AllData");

         return allDataFromJson(jsonDecode(cacheData.syncData.toString()));
       } else {
         //show error message
         return null;
       }
     }


  }
}