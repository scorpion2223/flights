import 'package:dartz/dartz.dart';
import 'package:flightes/core/public/feature/cities/domain/repositories/cities_repository.dart';

import '../../../../../errors/failures.dart';
import '../entities/cities_entity.dart';

class GetCitiesUseCase{
  final CitiesRepository citiesRepository;

  GetCitiesUseCase({required this.citiesRepository});

  Future<Either<Failure,CitiesEntity>> call() async => await citiesRepository.getCities();
}