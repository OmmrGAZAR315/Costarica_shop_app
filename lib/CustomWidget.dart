import 'package:assignment13/OnTap.dart';
import 'package:flutter/material.dart';

import 'BasicModel.dart';

class CustomWidget extends StatelessWidget {
  ListData? lista2;
  int fendix;
  double topper = 0;

  CustomWidget({this.lista2, required this.fendix});

  @override
  get primaryColor => Colors.purple;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 5, right: 5),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            onTap(objectPassed: lista2, dex: fendix)));
              },
              child: Container(
                margin: EdgeInsets.only(top: 60),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  shadowColor: Colors.grey,
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 70, bottom: 10, left: 10, right: 10),
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lista2!.DataList[fendix]["title"],
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "EGP ${lista2!.DataList[fendix]["price"]}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Text(
                            "EGP ${lista2!.DataList[fendix]["Dprice"]}",
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${lista2!.DataList[fendix]["cat"]}',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "⭐⭐⭐ ${lista2!.DataList[fendix]["rate"].toString()} ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          Text(
                              "(${lista2!.DataList[fendix]["count"].toString()})")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -28,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              onTap(objectPassed: lista2, dex: fendix)));
                },
                child: Image.network(
                  lista2!.DataList[fendix]["image"],
                  height: 160,
                  width: 150,
                ),
              ),
            ),
            Positioned(
              left: 100,
              top: 10,
              child: Container(
                // margin: EdgeInsets.only(left: 10),
                alignment: Alignment.center,
                width: 77,
                height: 100,
                child: Text("Discout 25%"),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink.shade500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
