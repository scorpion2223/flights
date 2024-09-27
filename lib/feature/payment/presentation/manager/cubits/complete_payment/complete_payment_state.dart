part of 'complete_payment_cubit.dart';

@immutable
abstract class CompletePaymentState {}

class CompletePaymentInitial extends CompletePaymentState {}

class CompletePaymentSuccess extends CompletePaymentState {
  final String message;

  CompletePaymentSuccess({required this.message});
}
class CompletePaymentFailed extends CompletePaymentState {
  final String message;

  CompletePaymentFailed({required this.message});
}
class CompletePaymentLoading extends CompletePaymentState {}
