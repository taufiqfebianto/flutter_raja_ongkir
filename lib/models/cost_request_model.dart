// To parse this JSON data, do
//
//     final costRequestModel = costRequestModelFromJson(jsonString);

import 'dart:convert';

class CostRequestModel {
  CostRequestModel({
    this.origin,
    this.destination,
    this.weight,
    this.courier,
    this.iosKey
  });

  String? origin;
  String? destination;
  int? weight;
  String? courier;
  String? iosKey;

  factory CostRequestModel.fromRawJson(String str) =>
      CostRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CostRequestModel.fromJson(Map<String, dynamic> json) =>
      CostRequestModel(
        origin: json["origin"],
        destination: json["destination"],
        weight: json["weight"],
        courier: json["courier"],
        iosKey: json["ios-key"],
      );

  Map<String, dynamic> toJson() => {
        "origin": origin,
        "destination": destination,
        "weight": weight,
        "courier": courier,
        "ios-key": iosKey,
      };
}
