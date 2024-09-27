part of 'get_countries_cubit.dart';

@immutable
abstract class GetCountriesState {}

class GetCountriesInitial extends GetCountriesState {}


class GetCountriesSuccess extends GetCountriesState {
  final CountryEntity entity;

  GetCountriesSuccess({required this.entity});
}
class GetCountriesFailed extends GetCountriesState {
  final String message;

  GetCountriesFailed({required this.message});
}
class GetCountriesLoading extends GetCountriesState {}

