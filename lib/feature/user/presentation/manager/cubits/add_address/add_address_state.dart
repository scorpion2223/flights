part of 'add_address_cubit.dart';

@immutable
abstract class AddAddressState {}

class AddAddressInitial extends AddAddressState {}
class AddAddressSuccess extends AddAddressState {
  final String message;

  AddAddressSuccess({required this.message});
}
class AddAddressFailed extends AddAddressState {
  final String message;

  AddAddressFailed({required this.message});
}
class AddAddressLoading extends AddAddressState {}
