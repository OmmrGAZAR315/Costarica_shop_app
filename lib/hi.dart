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
