import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/travelers/domain/entities/travelers_entity.dart';

abstract class TravelersRepository{
  Future<Either<Failure,TravelersEntity>> getTravelers();

}