// To parse this JSON data, do
//
//     final specialisationModel = specialisationModelFromJson(jsonString);

import 'dart:convert';

SpecialisationModel specialisationModelFromJson(String str) => SpecialisationModel.fromJson(json.decode(str));

String specialisationModelToJson(SpecialisationModel data) => json.encode(data.toJson());

class SpecialisationModel {
  int? id;
  String? name;
  bool? isActive;

  SpecialisationModel({
    this.id,
    this.name,
    this.isActive,
  });

  factory SpecialisationModel.fromJson(Map<String, dynamic> json) => SpecialisationModel(
    id: json["id"],
    name: json["name"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_active": isActive,
  };
}
