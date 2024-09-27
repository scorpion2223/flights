import 'package:dartz/dartz.dart';
import 'package:flightes/core/public/feature/iata_codes/domian/repositories/iata_codes_repository.dart';

import '../../../../../errors/failures.dart';
import '../entities/iata_codes_entity.dart';

class GetIataCodesUseCase{
  final IataCodesRepository iataCodesRepository;

  GetIataCodesUseCase({required this.iataCodesRepository});

  Future<Either<Failure,IataCodes>> call()async =>await iataCodesRepository.getCodes();
}