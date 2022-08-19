import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
main() {
  runApp(AppRun());
}

class AppRun extends StatelessWidget {
  const AppRun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dio dio = Dio();
  List<dynamic> cont = [];
  String Url = 'https://fakestoreapi.com/products';

  Future<dynamic> getData() async {
    Response response = await dio.get(Url);
    // print(response.data);
    // print(response.statusCode);
    cont = response.data.map((element) => Product.fromJson(element)).toList();
    print(cont);
    return cont;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
          future: getData(),
          builder: ((context, snapShot) {
            return snapShot.hasData
                ? GridView.builder(
                    itemCount: cont.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, i) {
                      return Container(
                        padding: EdgeInsets.all(25),
                        margin: EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return newPage(cont2: cont, x: i);
                            },));
                          },
                          child: ListTile(
                            title: Image.network(cont[i].image),
                            subtitle: Container(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "price= ${cont[i].price}",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            //  backgroundImage: NetworkImage("${post[i]['image']}"),
                          ),
                        ),
                      );
                    })
                : snapShot.hasError
                    ? Text('data')
                    : Center(child: CupertinoActivityIndicator());
          })),
    ));
  }
}
class newPage extends StatelessWidget {
List cont2;
int x;
newPage({required this.cont2, required this.x});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(cont2[x].image),
    );
  }
}
class Product {
  int? id;
  String? title;
  String? description;
  String? category;
  dynamic price;
  String? image;
  dynamic rate;
  int? count;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rate = json['rating']["rate"];
    count = json['rating']["count"];
    price = json['price'];
  }
}

// class Rate {
//   dynamic rate;
//   int? count;
//
//   // Rate.fromJson(Map<String, dynamic> json) {
//   //   rate = json['rate'];
//   //   count = json['count'];
//   // }
// }
