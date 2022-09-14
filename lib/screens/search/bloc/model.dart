import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

class SearchModel {
  SearchModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datum> data;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    required this.id,
    required this.name,
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        // priceBeforeDiscount: json["price_before_discount"].toDouble(),
        price: json["price"].toDouble(),
        description: json["description"],
      );
}
