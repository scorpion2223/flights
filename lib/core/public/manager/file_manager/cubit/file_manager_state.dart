part of 'file_manager_cubit.dart';

@immutable
abstract class FileManagerState {}

class FileManagerInitial extends FileManagerState {}
class FileManagerSuccess extends FileManagerState {}
class FileManagerFailed extends FileManagerState {
  final String message;

  FileManagerFailed({required this.message});
}

