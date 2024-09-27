 import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/cancellation_reasons/data/data_source/remote/cancellation_reasons_remote_data_source.dart';
import 'package:flightes/core/public/feature/cancellation_reasons/domain/entities/cancellation_reasons_entity.dart';
import 'package:flightes/core/public/feature/cancellation_reasons/domain/repositories/cancellation_reasons_repository.dart';

class CancellationReasonsRepositoryImpl implements CancellationReasonsRepository{

  final CancellationReasonsRemoteDataSource cancellationReasonsRemoteDataSource;

  CancellationReasonsRepositoryImpl({required this.cancellationReasonsRemoteDataSource});
  @override
  Future<Either<Failure, CancellationReasonsEntity>> getData() async{
    try{
      final response = await cancellationReasonsRemoteDataSource.getData();
      return Right(response);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

}