part of 'store_booking_cubit.dart';

@immutable
abstract class StoreBookingState {}

class StoreBookingInitial extends StoreBookingState {}

class StoreBookingSuccess extends StoreBookingState {
  final String message;

  StoreBookingSuccess({required this.message});
}
class StoreBookingFailed extends StoreBookingState {
  final String message;

  StoreBookingFailed({required this.message});
}
class StoreBookingLoading extends StoreBookingState {}
