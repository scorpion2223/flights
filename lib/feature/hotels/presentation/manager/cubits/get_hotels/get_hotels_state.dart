part of 'get_hotels_cubit.dart';

@immutable
abstract class GetHotelsState {}

class GetHotelsInitial extends GetHotelsState {}



class GetHotelsSuccess extends GetHotelsState {
  final HotelsEntity entity;

  GetHotelsSuccess({required this.entity});
}
class GetHotelsFailed extends GetHotelsState {
  final String message;

  GetHotelsFailed({required this.message});
}
class GetHotelsLoading extends GetHotelsState {

}
class GetHotelsEmpty extends GetHotelsState {
  final String message;

  GetHotelsEmpty({required this.message});
}
class GetHotelsFailedExternalServer extends GetHotelsState {
  final String message;

  GetHotelsFailedExternalServer({required this.message});
}


