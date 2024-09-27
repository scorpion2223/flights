import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/public/feature/country_codes/domain/entities/country_code_entity.dart';
import 'package:flightes/core/public/feature/country_codes/domain/repositories/country_codes_repository.dart';

class GetCountryCodesUseCase{
  final CountryCodesRepository codesRepository ;

  GetCountryCodesUseCase({required this.codesRepository});
  Future<Either<Failure,CountryCodesEntity>> call()async=>await codesRepository.getCodes();


}