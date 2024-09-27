import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/document_param.dart';
import 'package:flightes/feature/user/domain/repositories/user_repository.dart';

class ModifyDocumentsUseCase{
  final UserRepository userRepository;

  ModifyDocumentsUseCase({required this.userRepository});

  Future<Either<Failure,Unit>> call(DocumentParam param , int documentId) async =>await userRepository.modifyDocument(param, documentId);
}