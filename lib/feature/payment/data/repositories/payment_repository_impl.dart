import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/payment_param.dart';
import 'package:flightes/feature/payment/data/data_sources/remote/payment_remote_data_source.dart';
import 'package:flightes/feature/payment/domain/entities/payment_entity.dart';
import 'package:flightes/feature/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository{
  final PaymentRemoteDataSource remoteDataSource;

  PaymentRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, Unit>> completePayment(PaymentEntity param) async{
    try{
      final response = await remoteDataSource.completePayment(param);
      return Right(response);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PaymentEntity>> startPayment(PaymentParam param) async{
    try{
      final response = await remoteDataSource.startPayment(param);
      return Right(response);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

}