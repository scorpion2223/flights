import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/hotels_param.dart';
import 'package:flightes/feature/hotels/data/data_source/remote/hotels_remote_data_source.dart';
import 'package:flightes/feature/hotels/domain/entities/hotels_entity.dart';
import 'package:flightes/feature/hotels/domain/repositories/hotels_repository.dart';

class HotelsRepositoryImpl  implements HotelsRepository{
  final HotelsRemoteDataSource  hotelsRemoteDataSource;

  HotelsRepositoryImpl({required this.hotelsRemoteDataSource});
  @override
  Future<Either<Failure, HotelsEntity>> getHotels(HotelsParam param) async{
   try{
     final response = await hotelsRemoteDataSource.getHotels(param);
     return Right(response);
   }on ServerException{
     return Left(ServerFailure());
   }on UnExpictedException{
     return Left(UnExpFailure());
   }
  }

}