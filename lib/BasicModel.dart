class ListData {
  List DataList = [];
  String title = "";
  dynamic price;

  ListData.fromJson(jsonData) {
    jsonData.forEach((v) {
      price = 0;
      Map<String, dynamic> pam = {};
      pam["id"] = v["id"];
      title = v["title"];
      pam["title"] = title;
      pam["cat"] = v["category"];
      pam["image"] = v["image"];
      price = v["price"];
      pam["price"] = price;
      price *= 0.85;
      price = price.toStringAsFixed(2);
      pam["Dprice"] = price;
      pam["rate"] = v["rating"]["rate"];
      pam["count"] = v["rating"]["count"];
      pam["desc"] = v["description"];
      if (title.length > 53) {
        pam["title"] = title.substring(0, 53);
      }
      DataList.add(pam);
    });
  }
}
