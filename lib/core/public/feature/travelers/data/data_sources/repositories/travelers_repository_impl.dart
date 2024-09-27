import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/travelers/data/data_sources/remote/travelers_remote_data_source.dart';
import 'package:flightes/core/public/feature/travelers/domain/entities/travelers_entity.dart';
import 'package:flightes/core/public/feature/travelers/domain/repositories/travelers_repository.dart';

class TravelersRepositoryImpl implements TravelersRepository{
  final TravelersRemoteDataSource dataSource;

  TravelersRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, TravelersEntity>> getTravelers() async{
   try{
     final response = await dataSource.getTravelers();
     return Right(response);
   }on ServerException{
     return Left(ServerFailure());
   }
  }

}