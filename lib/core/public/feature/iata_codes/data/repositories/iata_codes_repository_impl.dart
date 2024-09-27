import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/iata_codes/data/data_sources/remote/iata_codes_remote_data_source.dart';
import 'package:flightes/core/public/feature/iata_codes/domian/entities/iata_codes_entity.dart';
import 'package:flightes/core/public/feature/iata_codes/domian/repositories/iata_codes_repository.dart';

class IataCodesRepositoryImpl implements IataCodesRepository{
  final IataCodesRemoteDataSource iataCodesRemoteDataSource;

  IataCodesRepositoryImpl({required this.iataCodesRemoteDataSource});
  @override
  Future<Either<Failure, IataCodes>> getCodes() async{
  try {
    final response = await iataCodesRemoteDataSource.getCodes();
    return Right(response);
  }on ServerException{
    return Left(ServerFailure());
  }
  }

}