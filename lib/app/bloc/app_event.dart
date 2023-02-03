part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class GetProvinceEvent extends AppEvent {
  const GetProvinceEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetProvinceEvent : ';
  }
}

class GetCityOriginEvent extends AppEvent {
  final String originProvinceId;
  const GetCityOriginEvent(this.originProvinceId);

  @override
  List<Object> get props => [originProvinceId];

  @override
  String toString() {
    return 'GetCityOriginEvent : $originProvinceId';
  }
}

class GetCityDestinationEvent extends AppEvent {
  final String destinationProvinceId;
  const GetCityDestinationEvent(this.destinationProvinceId);

  @override
  List<Object> get props => [destinationProvinceId];

  @override
  String toString() {
    return 'GetCityDestinationEvent : $destinationProvinceId';
  }
}

class CheckCostEvent extends AppEvent {
  final CostRequestModel model;
  const CheckCostEvent(this.model);

  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'CheckCostEvent : ${model.toJson()}';
  }
}
