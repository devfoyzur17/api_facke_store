// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SingleProductModel SingleProductModelFromJson(String str) => SingleProductModel.fromJson(json.decode(str));

String SingleProductModelToJson(SingleProductModel data) => json.encode(data.toJson());

class SingleProductModel {
    SingleProductModel({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
    });

    int id;
    String title;
    double price;
    String description;
    String category;
    String image;
    Rating rating;

    factory SingleProductModel.fromJson(Map<String, dynamic> json) => SingleProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toJson(),
    };
}

class Rating {
    Rating({
        required this.rate,
        required this.count,
    });

    double rate;
    int count;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
