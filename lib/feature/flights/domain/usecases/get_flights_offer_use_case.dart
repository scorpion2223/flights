
import 'package:dartz/dartz.dart';
import 'package:flightes/feature/flights/domain/entities/flights_offers_with_pricing_entity.dart';
import 'package:flightes/feature/flights/domain/repositories/flights_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/search_param.dart';
import '../entities/flights.dart';

class GetFlightsOfferUseCase{
  final FlightsRepository flightsRepository;

  GetFlightsOfferUseCase({required this.flightsRepository});
  Future<Either<Failure,FlightsOffersWithPricingEntity>> call(SearchParam param)async =>await flightsRepository.getFlightsOffer(param);
}