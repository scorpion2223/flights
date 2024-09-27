import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/country_codes/data/data_sources/remote/country_codes_remote_data_source.dart';
import 'package:flightes/core/public/feature/country_codes/domain/entities/country_code_entity.dart';
import 'package:flightes/core/public/feature/country_codes/domain/repositories/country_codes_repository.dart';

class CountryCodesRepositoryImpl implements CountryCodesRepository{
  final CountryCodesRemoteDataSource codesRemoteDataSource;

  CountryCodesRepositoryImpl({required this.codesRemoteDataSource});
  @override
  Future<Either<Failure, CountryCodesEntity>> getCodes()async {
    try{
      final response = await codesRemoteDataSource.getCodes();
      return Right(response);
    }on ServerException{
      return Left(ServerFailure());
    }
  }


}