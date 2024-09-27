part of 'start_payment_cubit.dart';

@immutable
abstract class StartPaymentState {}

class StartPaymentInitial extends StartPaymentState {}

class StartPaymentSuccess extends StartPaymentState {
  final PaymentEntity entity;

  StartPaymentSuccess({required this.entity});
}
class StartPaymentFailed extends StartPaymentState {
  final String message;

  StartPaymentFailed({required this.message});
}
class StartPaymentLoading extends StartPaymentState {}
