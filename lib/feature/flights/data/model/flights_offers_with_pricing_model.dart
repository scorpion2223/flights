import 'package:flightes/feature/flights/domain/entities/flights_offers_with_pricing_entity.dart';

class FlightsOffersWithPricingModel extends FlightsOffersWithPricingEntity{
  FlightsOffersWithPricingModel({required super.data});
  factory FlightsOffersWithPricingModel.fromJson(Map<String, dynamic> json) => FlightsOffersWithPricingModel(
    data: json["data"] == null ? null : FlightsOffersWithPricingEntityData.fromJson(json["data"]),
  );


}