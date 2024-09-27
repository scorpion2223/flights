import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/feature/user/domain/entities/user_documents_entity.dart';
import 'package:flightes/feature/user/domain/repositories/user_repository.dart';

class GetUserDocumentsUseCase{
  final UserRepository userRepository;

  GetUserDocumentsUseCase({required this.userRepository});

  Future<Either<Failure,UserDocumentsEntity>> call(int userId) async => await userRepository.getUserDocuments(userId);
}