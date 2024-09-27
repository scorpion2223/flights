part of 'modify_document_cubit.dart';

@immutable
abstract class ModifyDocumentState {}

class ModifyDocumentInitial extends ModifyDocumentState {}
class ModifyDocumentSuccess extends ModifyDocumentState {
  final String message;

  ModifyDocumentSuccess({required this.message});
}
class ModifyDocumentFailed extends ModifyDocumentState {
  final String message;

  ModifyDocumentFailed({required this.message});
}
class ModifyDocumentLoading extends ModifyDocumentState {}
