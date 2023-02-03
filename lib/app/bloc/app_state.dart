part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class GetProvinceSuccessState extends AppState {
  final ProvinceResponseModel model;
  const GetProvinceSuccessState(this.model);

  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'GetProvinceSuccessState : ${model.toJson()}';
  }
}

class GetCityOriginSuccessState extends AppState {
  final CityResponseModel model;
  const GetCityOriginSuccessState(this.model);

  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'GetCityOriginSuccessState : ${model.toJson()}';
  }
}

class GetCityDestinationSuccessState extends AppState {
  final CityResponseModel model;
  const GetCityDestinationSuccessState(this.model);

  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'GetCityDestinationSuccessState : ${model.toJson()}';
  }
}

class CheckCostSuccessState extends AppState {
  final CostResponseModel model;
  const CheckCostSuccessState(this.model);

  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'CheckCostSuccessState : ${model.toJson()}';
  }
}

class FailedState extends AppState {
  const FailedState({this.message, this.statusCode, this.errorMessage});
  final String? message;
  final int? statusCode;
  final String? errorMessage;

  @override
  List<Object> get props => [message!, statusCode!, errorMessage!];

  @override
  String toString() =>
      'FailedState { message : $message, statusCode: $statusCode, errorMessage: $errorMessage }';
}