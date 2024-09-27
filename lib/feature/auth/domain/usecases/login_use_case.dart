import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/user_param.dart';
import 'package:flightes/feature/auth/domain/repositories/auth_repository.dart';

class LoginUseCase{
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});
  Future<Either<Failure,Unit>> call(UserParam param) async =>await authRepository.login(param);
}