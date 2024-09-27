import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/user_param.dart';
import 'package:flightes/feature/auth/domain/repositories/auth_repository.dart';

import '../data_sources/remote/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, Unit>> login(UserParam param) async{
    try{
      final response = await authRemoteDataSource.login(param);
      return const Right(unit);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async{
    try{
      final response = await authRemoteDataSource.logout();
      return const Right(unit);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> register(UserParam param) async{
    try{
      final response = await authRemoteDataSource.register(param);
      return const Right(unit);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

}