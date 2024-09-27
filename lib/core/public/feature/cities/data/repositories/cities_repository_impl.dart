import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/cities/data/data_sources/remote/cities_remote_data_source.dart';
import 'package:flightes/core/public/feature/cities/domain/entities/cities_entity.dart';
import 'package:flightes/core/public/feature/cities/domain/repositories/cities_repository.dart';

class CitiesRepositoryImpl implements CitiesRepository{
  final CitiesRemoteDataSource citiesRemoteDataSource;

  CitiesRepositoryImpl({required this.citiesRemoteDataSource});
  @override
  Future<Either<Failure, CitiesEntity>> getCities()async {
  try{
    final response = await citiesRemoteDataSource.getCities();
    return Right(response);
  }on ServerException{
    return Left(ServerFailure());
  }
  }

}