// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

class ProductsModel {
  ProductsModel({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  int currentPage;
  List<ProductsData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<ProductsData>.from(json["data"].map((x) => ProductsData.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );
}

class ProductsData {
  ProductsData({
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

  factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        // priceBeforeDiscount: json["price_before_discount"].toDouble(),
        price: json["price"].toDouble(),
        description: json["description"],
      );
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] ??"",
        label: json["label"]??"",
        active: json["active"]??false,
      );
}
