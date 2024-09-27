part of 'get_user_documents_cubit.dart';

@immutable
abstract class GetUserDocumentsState {}

class GetUserDocumentsInitial extends GetUserDocumentsState {}
class GetUserDocumentsSuccess extends GetUserDocumentsState {
  final UserDocumentsEntity entity;

  GetUserDocumentsSuccess({required this.entity});
}
class GetUserDocumentsFailed extends GetUserDocumentsState {
  final String message;

  GetUserDocumentsFailed({required this.message});
}
class GetUserDocumentsLoading extends GetUserDocumentsState {}
