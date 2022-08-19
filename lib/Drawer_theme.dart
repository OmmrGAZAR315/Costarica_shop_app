import 'package:flutter/material.dart';

get primaryColor => Colors.purple;

class dower extends StatelessWidget {
  const dower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(25),
                        color: primaryColor,
                        border: Border.all(color: Colors.white30, width: 10)),
                    child: ListTile(
                        title: Text(
                          "Sign in",
                          style: TextStyle(fontSize: 26),
                        ),
                        trailing: Icon(Icons.login, size: 35)),
                  ),
                  // Divider(
                  //   color: Colors.pink,
                  //   thickness: 2.5,
                  //   indent: 20,
                  //   endIndent: 20,
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(25),
                        color: primaryColor,
                        border: Border.all(color: Colors.white30, width: 10)),
                    child: ListTile(
                        title: Text("Create an account",
                            style: TextStyle(fontSize: 26)),
                        trailing: Icon(Icons.account_circle, size: 35)),
                  ),

                  // Divider(
                  //   color: Colors.pink,
                  //   thickness: 2.5,
                  //   indent: 5,
                  //   endIndent: 5,
                  // ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(25),
                    color: primaryColor,
                    border: Border.all(color: Colors.white30, width: 10)),
                child: ListTile(
                  title: Text(
                    "Exit App",
                    style: TextStyle(fontSize: 26),
                  ),
                  trailing: Icon(
                    Icons.logout,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
