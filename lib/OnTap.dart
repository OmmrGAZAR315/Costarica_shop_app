import 'package:flutter/material.dart';

class onTap extends StatelessWidget {
  get primaryColor => Colors.purple;
  var objectPassed;
  int dex;
  String lorem =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic atque fuga, necessitatibus repudiandae doloribus laudantium eos quis temporibus veritatis reprehenderit nostrum vel nisi laborum cum in tempore quisquam eligendi? Temporibus numquam nostrum deserunt iste! Facere illum fugit repellendus ipsam mollitia, nemo iusto sapiente ipsum voluptate minima deserunt? Odio, libero possimus. Accusamus maxime dolor excepturi commodi doloribus itaque? Doloribus rerum nisi accusantium cupiditate repellat praesentium ex similique in non id magnam quibusdam culpa eos numquam ad officiis, est, accusamus ducimus facere. Dicta, vero doloribus maiores doloremque omnis natus placeat quos possimus expedita officia nulla aperiam quam voluptas veritatis quas sunt at. Officiis illo aliquam soluta corporis harum voluptatem minima repudiandae ea unde natus dolorum non earum quam, sed excepturi impedit deserunt in praesentium. Ratione illum aut ipsum magni facere excepturi tempora et laudantium, in distinctio quasi corrupti adipisci aliquid laboriosam eaque perferendis placeat vitae nemo incidunt voluptatibus? Ut numquam illo molestias?";

  onTap({this.objectPassed, required this.dex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.pink,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                size: 25,
              ))
        ],
        backgroundColor: primaryColor,
        title: Center(child: Text("Two & Half")),
      ),
      // backgroundColor: Colors.purple.shade200,
      body: Stack(
        children: [
          CustomScrollView(slivers: <Widget>[
            SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 500,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.purple.shade100,
                    child: Text(
                        "${objectPassed.DataList[dex]["title"].toString().substring(0, 10)}",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  background:
                      Image.network(objectPassed?.DataList[dex]["image"]),
                )),
            SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Text(
                    "Price:",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    "EGP. ${objectPassed.DataList[dex]["price"].toString()}",
                    style: TextStyle(
                        fontSize: 28, decoration: TextDecoration.lineThrough),
                  ),
                  subtitle: Text(
                    "${objectPassed.DataList[dex]["Dprice"]}",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  leading: Text(
                    "Description:",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    "${objectPassed.DataList[dex]["desc"]} ${lorem}",
                    style: TextStyle(fontSize: 27),
                  ),
                ),
              ],
            )), // SliverList
          ]),
          Positioned(
            top: 14,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.center,
              child: Text("Discout 25%"),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink.shade500,
              ),
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
