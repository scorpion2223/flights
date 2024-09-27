import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/air_porst_param.dart';
import 'package:flightes/feature/air_porst/domain/entities/air_ports_entity.dart';

abstract class AirPortsRepository{
  Future<Either<Failure,AirPortsEntity>> getAirPorts(AirPortsParam param);

}