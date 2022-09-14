import 'dart:convert';

ProductsShowModel productsShowModelFromJson(String str) => ProductsShowModel.fromJson(json.decode(str));


class ProductsShowModel {
  ProductsShowModel({
   required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory ProductsShowModel.fromJson(Map<String, dynamic> json) => ProductsShowModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );


}

class Data {
  Data({
    required  this.id,
    required  this.name,
    required this.image,
    // required this.priceBeforeDiscount,
    required this.price,
    required this.description,
  });

  int id;
  String name;
  String image;
  // double priceBeforeDiscount;
  double price;
  String description;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    // priceBeforeDiscount: json["price_before_discount"].toDouble(),
    price: json["price"].toDouble(),
    description: json["description"],
  );

}
