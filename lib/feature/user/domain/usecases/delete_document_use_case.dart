import 'package:dartz/dartz.dart';
import 'package:flightes/feature/user/domain/repositories/user_repository.dart';

import '../../../../core/errors/failures.dart';

class DeleteDocumentUseCase{
  final UserRepository userRepository;

  DeleteDocumentUseCase({required this.userRepository});
  Future<Either<Failure,Unit>>  call(int documentId) async => await userRepository.deleteDocument(documentId);
}