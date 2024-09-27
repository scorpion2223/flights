part of 'delete_document_cubit.dart';

@immutable
abstract class DeleteDocumentState {}

class DeleteDocumentInitial extends DeleteDocumentState {}
class DeleteDocumentSuccess extends DeleteDocumentState {
  final String message;

  DeleteDocumentSuccess({required this.message});
}
class DeleteDocumentFailed extends DeleteDocumentState {
  final String message;

  DeleteDocumentFailed({required this.message});
}
class DeleteDocumentLoading extends DeleteDocumentState {}