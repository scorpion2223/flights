import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/cities/domain/entities/cities_entity.dart';

abstract class CitiesRepository{
  Future<Either<Failure,CitiesEntity>> getCities();

}