part of 'get_air_ports_cubit.dart';

@immutable
abstract class GetAirPortsState {}

class GetAirPortsInitial extends GetAirPortsState {}


class GetAirPortsSuccess extends GetAirPortsState {
  final AirPortsEntity entity;

  GetAirPortsSuccess({required this.entity});
}
class GetAirPortsFailed extends GetAirPortsState {
  final String message;

  GetAirPortsFailed({required this.message});
}
class GetAirPortsLoading extends GetAirPortsState {

}
class GetAirPortsEmpty extends GetAirPortsState {
  final String message;

  GetAirPortsEmpty({required this.message});
}
class GetAirPortsFailedExternalServer extends GetAirPortsState {
  final String message;

  GetAirPortsFailedExternalServer({required this.message});
}

