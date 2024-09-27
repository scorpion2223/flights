part of 'get_points_cubit.dart';

@immutable
abstract class GetPointsState {}

class GetPointsInitial extends GetPointsState {}
class GetPointsSuccess extends GetPointsState {
  final PointsEntity entity;

  GetPointsSuccess({required this.entity});
}
class GetPointsFailed extends GetPointsState {
  final String message;

  GetPointsFailed({required this.message});
}
class GetPointsLoading extends GetPointsState {}
