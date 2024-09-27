part of 'get_flights_offer_cubit.dart';

@immutable
abstract class GetFlightsOfferState {}

class GetFlightsOfferInitial extends GetFlightsOfferState {}

class GetFlightsOfferSuccess extends GetFlightsOfferState {
  final FlightsOffersWithPricingEntity entity;

  GetFlightsOfferSuccess({required this.entity});
}
class GetFlightsOfferFailed extends GetFlightsOfferState {
  final String message;

  GetFlightsOfferFailed({required this.message});
}
class GetFlightsOfferLoading extends GetFlightsOfferState {

}
class GetFlightsOfferEmpty extends GetFlightsOfferState {
  final String message;

  GetFlightsOfferEmpty({required this.message});
}
class GetFlightsOfferFailedExternalServer extends GetFlightsOfferState {
  final String message;

  GetFlightsOfferFailedExternalServer({required this.message});
}
