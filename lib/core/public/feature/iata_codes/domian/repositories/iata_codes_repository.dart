import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/iata_codes/domian/entities/iata_codes_entity.dart';

abstract class IataCodesRepository{
  Future<Either<Failure,IataCodes>> getCodes();
}