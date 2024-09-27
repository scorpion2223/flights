part of 'get_country_codes_cubit.dart';

@immutable
abstract class GetCountryCodesState {}

class GetCountryCodesInitial extends GetCountryCodesState {}


class GetCountryCodesSuccess extends GetCountryCodesState {
  final CountryCodesEntity entity;

  GetCountryCodesSuccess({required this.entity});
}
class GetCountryCodesFailed extends GetCountryCodesState {
  final String message;

  GetCountryCodesFailed({required this.message});
}
class GetCountryCodesLoading extends GetCountryCodesState {}
class GetCountryCodesEmpty extends GetCountryCodesState {
  final String message;

  GetCountryCodesEmpty({required this.message});
}

