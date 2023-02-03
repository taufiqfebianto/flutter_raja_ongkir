import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_raja_ongkir/models/city_response_model.dart';
import 'package:flutter_raja_ongkir/models/cost_request_model.dart';
import 'package:flutter_raja_ongkir/models/cost_response_model.dart';
import 'package:flutter_raja_ongkir/models/province_response_model.dart';
import 'package:flutter_raja_ongkir/repos/app_repo.dart';

import '../../shared/shared.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppRepo repo = AppRepo();
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {});
    on<GetProvinceEvent>((event, emit) async {
      try {
        ProvinceResponseModel response = await repo.getProvince();

        emit(GetProvinceSuccessState(response));
      } on NetworkException catch (e) {
        emit(FailedState(
            message: e.responseMessage.toString(),
            statusCode: e.httpStatus,
            errorMessage: e.data.toString()));
      }
    });
    on<GetCityOriginEvent>((event, emit) async {
      try {
        CityResponseModel response = await repo.getCity(event.originProvinceId);

        emit(GetCityOriginSuccessState(response));
      } on NetworkException catch (e) {
        emit(FailedState(
            message: e.responseMessage,
            statusCode: e.httpStatus,
            errorMessage: e.data));
      }
    });
     on<GetCityDestinationEvent>((event, emit) async {
      try {
        CityResponseModel response = await repo.getCity(event.destinationProvinceId);

        emit(GetCityDestinationSuccessState(response));
      } on NetworkException catch (e) {
        emit(FailedState(
            message: e.responseMessage,
            statusCode: e.httpStatus,
            errorMessage: e.data));
      }
    });
    on<CheckCostEvent>((event, emit) async {
      try {
        CostResponseModel response = await repo.checkCost(model: event.model);

        emit(CheckCostSuccessState(response));
      } on NetworkException catch (e) {
        emit(FailedState(
            message: e.responseMessage.toString(),
            statusCode: e.httpStatus,
            errorMessage: e.data.toString()));
      }
    });
  }
}
