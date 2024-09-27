import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/country_codes/domain/entities/country_code_entity.dart';

abstract class CountryCodesRepository{
  Future<Either<Failure,CountryCodesEntity>> getCodes();
}