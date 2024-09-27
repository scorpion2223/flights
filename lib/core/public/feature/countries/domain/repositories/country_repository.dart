import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/countries/data/models/country_model.dart';
import 'package:flightes/core/public/feature/countries/domain/entities/country_entity.dart';

abstract class CountryRepository{
  Future<Either<Failure,CountryEntity>> getCountries();

}