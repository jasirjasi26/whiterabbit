import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_white_rabbit/models/all_data.dart';

class EmployeeDetailsPage extends StatefulWidget {
  const EmployeeDetailsPage({Key? key, required this.allData})
      : super(key: key);

  final AllData allData;

  @override
  State<EmployeeDetailsPage> createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl: widget.allData.profileImage.toString(),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Container(
                      width: 55, height: 50, child: Icon(Icons.error)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.allData.name.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Card(
                elevation: 1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "User Name :  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.allData.name.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Email :  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.allData.email.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Phone Number :  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.allData.phone.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(
                            "Address :  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Flexible(
                            child: Text(
                              widget.allData.address!.street.toString() +
                                  "\n" +
                                  widget.allData.address!.city.toString() +
                                  "\n" +
                                  widget.allData.address!.zipcode.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  overflow: TextOverflow.clip,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Company Details :  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.allData.company?.name.toString() ?? '',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Website :  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.allData.website.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
