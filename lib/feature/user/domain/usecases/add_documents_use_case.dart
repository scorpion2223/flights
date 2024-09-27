import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/document_param.dart';
import 'package:flightes/feature/user/domain/repositories/user_repository.dart';

class AddDocumentsUseCase{
  final UserRepository userRepository;

  AddDocumentsUseCase({required this.userRepository});

  Future<Either<Failure,Unit>> call(DocumentParam param) async => await userRepository.addDocument(param);
}