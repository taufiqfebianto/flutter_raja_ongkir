// ignore_for_file: use_rethrow_when_possible

import 'package:flutter_raja_ongkir/models/city_response_model.dart';
import 'package:flutter_raja_ongkir/models/cost_request_model.dart';
import 'package:flutter_raja_ongkir/models/cost_response_model.dart';
import 'package:flutter_raja_ongkir/models/province_response_model.dart';

import '../shared/shared.dart';

class AppRepo {
  Future<ProvinceResponseModel> getProvince() async {
    final Map<String, dynamic> parameters = {
      'key': Constants.apiKey,
    };
    try {
      Map<String, dynamic> data = await network.getHttp(
          path: Constants.province,
          parameter: parameters,
          contentType: 'application/json');
      return ProvinceResponseModel.fromJson(data);
    } on NetworkException catch (e) {
      throw e;
    }
  }

  Future<CityResponseModel> getCity(String id) async {
    final Map<String, dynamic> parameters = {
      'key': Constants.apiKey,
      'province': id
    };
    try {
      Map<String, dynamic> data = await network.getHttp(
          path: Constants.city,
          parameter: parameters,
          contentType: 'application/json');
      return CityResponseModel.fromJson(data);
    } on NetworkException catch (e) {
      throw e;
    }
  }

  Future<CostResponseModel> checkCost({required CostRequestModel model}) async {
    try {
      final Map<String, dynamic> parameters = {
        'key': Constants.apiKey,
      };

      Map<String, dynamic> data = await network.postHttp(
          path: Constants.cost,
          parameter: parameters,
          content: model.toJson(),
          contentType: 'application/json');
      return CostResponseModel.fromJson(data);
    } on NetworkException catch (e) {
      throw e;
    }
  }
}
