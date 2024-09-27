import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/feature/user/domain/entities/documents_type_entity.dart';
import 'package:flightes/feature/user/domain/repositories/user_repository.dart';

class GetDocumentsTypeUseCase{
  final UserRepository userRepository;

  GetDocumentsTypeUseCase({required this.userRepository});

  Future<Either<Failure,DocumentsTypeEntity>> call()async =>await userRepository.getDocumentsType();
}