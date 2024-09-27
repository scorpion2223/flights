part of 'add_document_cubit.dart';

@immutable
abstract class AddDocumentState {}

class AddDocumentInitial extends AddDocumentState {}
class AddDocumentSuccess extends AddDocumentState {
  final String message;

  AddDocumentSuccess({required this.message});
}
class AddDocumentFailed extends AddDocumentState {
  final String message;

  AddDocumentFailed({required this.message});
}
class AddDocumentLoading extends AddDocumentState {}