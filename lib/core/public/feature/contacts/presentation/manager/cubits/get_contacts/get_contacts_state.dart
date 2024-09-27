part of 'get_contacts_cubit.dart';

@immutable
abstract class GetContactsState {}

class GetContactsInitial extends GetContactsState {}

class GetContactsSuccess extends GetContactsState {
  final ContactsEntity entity;

  GetContactsSuccess({required this.entity});
}
class GetContactsFailed extends GetContactsState {
  final String message;

  GetContactsFailed({required this.message});
}
class GetContactsLoading extends GetContactsState {}
class GetContactsEmpty extends GetContactsState {
  final String message;

  GetContactsEmpty({required this.message});
}

