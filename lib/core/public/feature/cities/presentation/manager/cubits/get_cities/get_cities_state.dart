part of 'get_cities_cubit.dart';

@immutable
abstract class GetCitiesState {}

class GetCitiesInitial extends GetCitiesState {}

class GetCitiesSuccess extends GetCitiesState {
  final CitiesEntity entity;

  GetCitiesSuccess({required this.entity});
}
class GetCitiesFailed extends GetCitiesState {
  final String message;

  GetCitiesFailed({required this.message});
}
class GetCitiesLoading extends GetCitiesState {}
