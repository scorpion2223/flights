import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/search_param.dart';
import 'package:flightes/feature/flights/domain/entities/flights.dart';

import '../entities/flights_offers_with_pricing_entity.dart';

abstract class FlightsRepository{
  Future<Either<Failure,FlightsOffersWithPricingEntity>> getFlightsOffer(SearchParam param);

}