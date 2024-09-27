import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/user_param.dart';

abstract class AuthRepository{
 Future<Either<Failure,Unit>> login(UserParam param);
 Future<Either<Failure,Unit>> register(UserParam param);
 Future<Either<Failure,Unit>> logout();
}