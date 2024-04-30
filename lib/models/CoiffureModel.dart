// To parse this JSON data, do
//
//     final coiffureModel = coiffureModelFromJson(jsonString);

import 'dart:convert';

CoiffureModel coiffureModelFromJson(String str) => CoiffureModel.fromJson(json.decode(str));

String coiffureModelToJson(CoiffureModel data) => json.encode(data.toJson());

class CoiffureModel {
  int? id;
  String? name;
  int? price;
  String? description;
  String? picture;
  int? isActive;
  int? specialisation;

  CoiffureModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.picture,
    this.isActive,
    this.specialisation,
  });

  factory CoiffureModel.fromJson(Map<String, dynamic> json) => CoiffureModel(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    picture: json["picture"],
    isActive: json["is_active"],
    specialisation: json["specialisation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "picture": picture,
    "is_active": isActive,
    "specialisation": specialisation,
  };
}
