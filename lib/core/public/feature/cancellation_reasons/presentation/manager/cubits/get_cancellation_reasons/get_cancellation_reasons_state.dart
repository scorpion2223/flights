part of 'get_cancellation_reasons_cubit.dart';

@immutable
abstract class GetCancellationReasonsState {}

class GetCancellationReasonsInitial extends GetCancellationReasonsState {}
class GetCancellationReasonsSuccess extends GetCancellationReasonsState {
  final CancellationReasonsEntity entity;

  GetCancellationReasonsSuccess({required this.entity});
}
class GetCancellationReasonsFailed extends GetCancellationReasonsState {
  final String message;

  GetCancellationReasonsFailed({required this.message});
}
class GetCancellationReasonsLoading extends GetCancellationReasonsState {

}
class GetCancellationReasonsEmpty extends GetCancellationReasonsState {
  final String message;

  GetCancellationReasonsEmpty({required this.message});
}
