import 'package:assignment13/Drawer_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'BasicModel.dart';
import 'CustomWidget.dart';

class Shooping extends StatefulWidget {
  @override
  State<Shooping> createState() => _Shooping();
}

class _Shooping extends State<Shooping> {
  ListData? lista;
  int item = 0;

  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    getData();
  }

  String url = "https://fakestoreapi.com/products";

  get primaryColor => Colors.purple;

  Future<ListData> getData() async {
    Response response = await dio.get(url);
    lista = ListData.fromJson((response.data));

    return lista!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        drawer: dower(),
        appBar: AppBar(
          shadowColor: Colors.pink,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchBar());
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  size: 25,
                ))
          ],
          backgroundColor: primaryColor,
          title: Center(child: Text("B Two & Half")),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? GridView.builder(
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, int index) => CustomWidget(
                      lista2: lista,
                      fendix: index,
                      item: item,
                    ),
                    itemCount: lista!.DataList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.48,
                      crossAxisCount: 2,
                    ),
                  )
                : snapshot.hasError
                    ? Stack(
                        children: [
                          Image.asset(
                              "images/cute-sad-raining-cloud-weather-icon-vector-21952269.jpg"),
                          Center(
                            child: Card(
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(26)),
                              elevation: 100,
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 60,
                                  child: Text(
                                    "Sorry, Something went wrong",
                                  )),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: SizedBox(
                          height: 80,
                          child: LoadingIndicator(
                            indicatorType: Indicator.lineScalePulseOut,
                            colors: [
                              Colors.red,
                              Colors.purple,
                              Colors.pink,
                              Colors.purple.shade600,
                              Colors.pink.shade400
                            ],
                          ),
                        ),
                      );
          },
        ));
  }
}

class SearchBar extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else
            query = '';
        },
        icon: Icon(Icons.clear));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: TextStyle(fontSize: 64),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List sugg = [];
    return ListView.builder(
      itemCount: sugg.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Column(
            children: [
              Text(sugg[2]),
              Text(sugg[3]),
              Text(sugg[1]),
              Text(sugg[0]),
            ],
          ),
          onTap: () {
            query = sugg[3];
            showResults(context);
          },
        );
      },
    );
  }
}
