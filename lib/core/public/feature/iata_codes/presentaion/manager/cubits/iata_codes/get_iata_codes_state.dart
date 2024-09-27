part of 'get_iata_codes_cubit.dart';

@immutable
abstract class GetIataCodesState {}

class GetIataCodesInitial extends GetIataCodesState {}

class GetIataCodesSuccess extends GetIataCodesState {
  final IataCodes entity;

  GetIataCodesSuccess({required this.entity});
}
class GetIataCodesFailed extends GetIataCodesState {
  final String message;

  GetIataCodesFailed({required this.message});
}
class GetIataCodesLoading extends GetIataCodesState {}
class GetIataCodesEmpty extends GetIataCodesState {
  final String message;

  GetIataCodesEmpty({required this.message});
}
