part of 'get_travelers_cubit.dart';

@immutable
abstract class GetTravelersState {}

class GetTravelersInitial extends GetTravelersState {}

class GetTravelersSuccess extends GetTravelersState {
  final TravelersEntity entity;

  GetTravelersSuccess({required this.entity});
}
class GetTravelersFailed extends GetTravelersState {
  final String message;

  GetTravelersFailed({required this.message});
}
class GetTravelersLoading extends GetTravelersState {}
class GetTravelersEmpty extends GetTravelersState {
  final String message;

  GetTravelersEmpty({required this.message});
}

