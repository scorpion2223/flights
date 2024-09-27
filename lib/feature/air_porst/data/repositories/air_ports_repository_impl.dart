import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/air_porst_param.dart';
import 'package:flightes/feature/air_porst/data/data_source/remote/air_ports_remote_data_source.dart';
import 'package:flightes/feature/air_porst/domain/entities/air_ports_entity.dart';
import 'package:flightes/feature/air_porst/domain/repositories/air_ports_repository.dart';

class AirPortsRepositoryImpl implements AirPortsRepository{
  final AirPortsRemoteDataSource airPortsRemoteDataSource;

  AirPortsRepositoryImpl({required this.airPortsRemoteDataSource});
  @override
  Future<Either<Failure, AirPortsEntity>> getAirPorts(AirPortsParam param) async{
  try{
    final response = await airPortsRemoteDataSource.getAirPorts(param);
    return Right(response);

  }on ServerException{
    return Left(ServerFailure());
  }
  }

}