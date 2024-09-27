part of 'get_documents_type_cubit.dart';

@immutable
abstract class GetDocumentsTypeState {}

class GetDocumentsTypeInitial extends GetDocumentsTypeState {}

class GetDocumentsTypeSuccess extends GetDocumentsTypeState {
  final DocumentsTypeEntity entity;

  GetDocumentsTypeSuccess({required this.entity});
}
class GetDocumentsTypeFailed extends GetDocumentsTypeState {
  final String message;

  GetDocumentsTypeFailed({required this.message});
}
class GetDocumentsTypeLoading extends GetDocumentsTypeState {}
