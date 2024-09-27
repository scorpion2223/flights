
import 'package:dartz/dartz.dart';
import 'package:flightes/core/public/feature/countries/domain/repositories/country_repository.dart';

import '../../../../../errors/failures.dart';
import '../entities/country_entity.dart';

class GetCountriesUseCase{
final CountryRepository countryRepository;

  GetCountriesUseCase({required this.countryRepository});

Future<Either<Failure,CountryEntity>> call() async =>await countryRepository.getCountries();
}