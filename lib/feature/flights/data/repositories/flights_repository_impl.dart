import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/search_param.dart';
import 'package:flightes/feature/flights/data/data_sources/remote/flights_remote_data_source.dart';
import 'package:flightes/feature/flights/domain/entities/flights.dart';
import 'package:flightes/feature/flights/domain/entities/flights_offers_with_pricing_entity.dart';
import 'package:flightes/feature/flights/domain/repositories/flights_repository.dart';

class FlightsRepositoryImpl implements FlightsRepository{
  final FlightsRemoteDataSource flightsRemoteDataSource;

  FlightsRepositoryImpl({required this.flightsRemoteDataSource});
  @override
  Future<Either<Failure, FlightsOffersWithPricingEntity>> getFlightsOffer(SearchParam param) async{
   try{
     final response = await flightsRemoteDataSource.getFlightsOffer(param);
     return Right(response);
   }on ServerException{
     return Left(ServerFailure());
   }on UnExpictedException{
     return Left(UnExpFailure());
   }on FieldFitchException{
     return Left(FieldFitchFailure());
   }
  }

}