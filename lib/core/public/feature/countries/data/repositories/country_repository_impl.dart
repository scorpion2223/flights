import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/countries/data/data_sources/remote/country_remote_data_source.dart';
import 'package:flightes/core/public/feature/countries/domain/entities/country_entity.dart';
import 'package:flightes/core/public/feature/countries/domain/repositories/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository{
  final CountryRemoteDataSource countryRemoteDataSource;

  CountryRepositoryImpl({required this.countryRemoteDataSource});
  @override
  Future<Either<Failure, CountryEntity>> getCountries() async{
    try{
      final response = await countryRemoteDataSource.getCountries();
      return Right(response);
    }on ServerException{
      return Left(ServerFailure());
    }

  }

}