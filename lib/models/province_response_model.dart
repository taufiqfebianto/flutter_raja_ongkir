// To parse this JSON data, do
//
//     final provinceResponseModel = provinceResponseModelFromJson(jsonString);

import 'dart:convert';

class ProvinceResponseModel {
  ProvinceResponseModel({
    this.rajaongkir,
  });

  Rajaongkir? rajaongkir;

  factory ProvinceResponseModel.fromRawJson(String str) =>
      ProvinceResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProvinceResponseModel.fromJson(Map<String, dynamic> json) =>
      ProvinceResponseModel(
        rajaongkir: Rajaongkir.fromJson(json["rajaongkir"]),
      );

  Map<String, dynamic> toJson() => {
        "rajaongkir": rajaongkir!.toJson(),
      };
}

class Rajaongkir {
  Rajaongkir({
    this.query,
    this.status,
    this.results,
  });

  Query? query;
  Status? status;
  List<Result>? results;

  factory Rajaongkir.fromRawJson(String str) =>
      Rajaongkir.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rajaongkir.fromJson(Map<String, dynamic> json) => Rajaongkir(
        query: Query.fromJson(json["query"]),
        status: Status.fromJson(json["status"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "query": query!.toJson(),
        "status": status!.toJson(),
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Query {
  Query({
    this.key,
  });

  String? key;

  factory Query.fromRawJson(String str) => Query.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
      };
}

class Result {
  Result({
    this.provinceId,
    this.province,
  });

  String? provinceId;
  String? province;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        provinceId: json["province_id"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "province_id": provinceId,
        "province": province,
      };
}

class Status {
  Status({
    this.code,
    this.description,
  });

  int? code;
  String? description;

  factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
      };
}
