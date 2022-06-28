import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_white_rabbit/controllers/all_data_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import 'employee_details_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final shoppingController = Get.put(AllDataController());
  var ns = TextEditingController();
  String searchValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(6, 3),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: TextFormField(
                    controller: ns,
                    onChanged: (data) {
                      setState(() {
                        searchValue = ns.text;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 5, top: 15, right: 15),
                      isDense: false,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25.0,
                        color: Colors.grey,
                      ),
                    )),
              ),
            ),
            Expanded(
              child: GetX<AllDataController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.allData.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (controller.allData[index].name!
                        .toLowerCase()
                        .toString()
                        .contains(searchValue.toLowerCase().toString())) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmployeeDetailsPage(
                                      allData: controller.allData[index]),
                                        ),
                              );
                            },
                            tileColor: Colors.white,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CachedNetworkImage(
                                imageUrl: controller.allData[index].profileImage
                                    .toString(),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    Container(width:55,height:50,child: Icon(Icons.error)),
                              ),
                            ),
                            title: Text(
                              controller.allData[index].name.toString() ?? '',
                              style: TextStyle(fontSize: 18),
                            ),
                            subtitle: controller.allData[index].company != null
                                ? Text("Company : " +
                                    controller.allData[index].company!.name
                                        .toString())
                                : Text("Company : No data..."),
                          ),
                          Divider(
                            height: 3,
                          )
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
