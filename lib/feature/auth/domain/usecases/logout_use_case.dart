import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/feature/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase{
  final AuthRepository authRepository;

  LogoutUseCase({required this.authRepository});

  Future<Either<Failure,Unit>> call()async =>await authRepository.logout();
}