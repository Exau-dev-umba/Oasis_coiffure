// To parse this JSON data, do
//
//     final reservationModel = reservationModelFromJson(jsonString);

import 'dart:convert';

ReservationModel reservationModelFromJson(String str) => ReservationModel.fromJson(json.decode(str));

String reservationModelToJson(ReservationModel data) => json.encode(data.toJson());

class ReservationModel {
  int? id;
  String? coiffure;
  Compte? compte;
  bool? isPaid;
  Compte? salon;
  bool? isActive;

  ReservationModel({
    this.id,
    this.coiffure,
    this.compte,
    this.isPaid,
    this.salon,
    this.isActive,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) => ReservationModel(
    id: json["id"],
    coiffure: json["coiffure"],
    compte: json["compte"] == null ? null : Compte.fromJson(json["compte"]),
    isPaid: json["is_paid"],
    salon: json["salon"] == null ? null : Compte.fromJson(json["salon"]),
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "coiffure": coiffure,
    "compte": compte?.toJson(),
    "is_paid": isPaid,
    "salon": salon?.toJson(),
    "is_active": isActive,
  };
}

class Compte {
  Compte();

  factory Compte.fromJson(Map<String, dynamic> json) => Compte(
  );

  Map<String, dynamic> toJson() => {
  };
}
