// To parse this JSON data, do
//
//     final flights = flightsFromJson(jsonString);

import 'dart:convert';



String flightsToJson(Flights data) => json.encode(data.toJson());

abstract class Flights {
  Data? data;

  Flights({
   required this.data,
  });



  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  Headers? headers;
  Original? original;
  dynamic exception;

  Data({
    this.headers,
    this.original,
    this.exception,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        headers:
            json["headers"] == null ? null : Headers.fromJson(json["headers"]),
        original: json["original"] == null
            ? null
            : Original.fromJson(json["original"]),
        exception: json["exception"],
      );

  Map<String, dynamic> toJson() => {
        "headers": headers?.toJson(),
        "original": original?.toJson(),
        "exception": exception,
      };
}

class Headers {
  Headers();

  factory Headers.fromJson(Map<String, dynamic> json) => Headers();

  Map<String, dynamic> toJson() => {};
}

class Original {
  Meta? meta;
  List<Datum>? data;
  Dictionaries? dictionaries;
  List<dynamic> ? errors;

  Original({
    this.meta,
    this.data,
    this.dictionaries,
    this.errors,
  });

  factory Original.fromJson(Map<String, dynamic> json) {
    List<dynamic> listdatum = json['data'].map((item)
    {
      return Datum.fromJson(item);
    }).toList();
    return Original(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null
            ? []
            : listdatum.cast<Datum>(),
        dictionaries: json["dictionaries"] == null
            ? null
            : Dictionaries.fromJson(json["dictionaries"]),
        errors: json['errors']
    );
  }

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "dictionaries": dictionaries?.toJson(),
      };
}

class Datum {
  String? type;
  String? id;
  String? source;
  bool? instantTicketingRequired;
  bool? nonHomogeneous;
  bool? oneWay;
  bool? isUpsellOffer;
  DateTime? lastTicketingDate;
  DateTime? lastTicketingDateTime;
  int? numberOfBookableSeats;
  List<Itinerary>? itineraries;
  DatumPrice? price;
  PricingOptions? pricingOptions;
  List<String>? validatingAirlineCodes;
  List<TravelerPricing>? travelerPricings;

  Datum({
    this.type,
    this.id,
    this.source,
    this.instantTicketingRequired,
    this.nonHomogeneous,
    this.oneWay,
    this.isUpsellOffer,
    this.lastTicketingDate,
    this.lastTicketingDateTime,
    this.numberOfBookableSeats,
    this.itineraries,
    this.price,
    this.pricingOptions,
    this.validatingAirlineCodes,
    this.travelerPricings,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        id: json["id"],
        source: json["source"],
        instantTicketingRequired: json["instantTicketingRequired"],
        nonHomogeneous: json["nonHomogeneous"],
        oneWay: json["oneWay"],
        isUpsellOffer: json["isUpsellOffer"],
        lastTicketingDate: json["lastTicketingDate"] == null
            ? null
            : DateTime.parse(json["lastTicketingDate"]),
        lastTicketingDateTime: json["lastTicketingDateTime"] == null
            ? null
            : DateTime.parse(json["lastTicketingDateTime"]),
        numberOfBookableSeats: json["numberOfBookableSeats"],
        itineraries: json["itineraries"] == null
            ? []
            : List<Itinerary>.from(
                json["itineraries"]!.map((x) => Itinerary.fromJson(x))),
        price:
            json["price"] == null ? null : DatumPrice.fromJson(json["price"]),
        pricingOptions: json["pricingOptions"] == null
            ? null
            : PricingOptions.fromJson(json["pricingOptions"]),
        validatingAirlineCodes: json["validatingAirlineCodes"] == null
            ? []
            : List<String>.from(json["validatingAirlineCodes"]!.map((x) => x)),
        travelerPricings: json["travelerPricings"] == null
            ? []
            : List<TravelerPricing>.from(json["travelerPricings"]!
                .map((x) => TravelerPricing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "source": source,
        "instantTicketingRequired": instantTicketingRequired,
        "nonHomogeneous": nonHomogeneous,
        "oneWay": oneWay,
        "isUpsellOffer": isUpsellOffer,
        "lastTicketingDate":
            "${lastTicketingDate!.year.toString().padLeft(4, '0')}-${lastTicketingDate!.month.toString().padLeft(2, '0')}-${lastTicketingDate!.day.toString().padLeft(2, '0')}",
        "lastTicketingDateTime":
            "${lastTicketingDateTime!.year.toString().padLeft(4, '0')}-${lastTicketingDateTime!.month.toString().padLeft(2, '0')}-${lastTicketingDateTime!.day.toString().padLeft(2, '0')}",
        "numberOfBookableSeats": numberOfBookableSeats,
        "itineraries": itineraries == null
            ? []
            : List<dynamic>.from(itineraries!.map((x) => x.toJson())),
        "price": price?.toJson(),
        "pricingOptions": pricingOptions?.toJson(),
        "validatingAirlineCodes": validatingAirlineCodes == null
            ? []
            : List<dynamic>.from(validatingAirlineCodes!.map((x) => x)),
        "travelerPricings": travelerPricings == null
            ? []
            : List<dynamic>.from(travelerPricings!.map((x) => x.toJson())),
      };
}

class Itinerary {
  String? duration;
  List<Segment>? segments;

  Itinerary({
    this.duration,
    this.segments,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        duration: json["duration"],
        segments: json["segments"] == null
            ? []
            : List<Segment>.from(
                json["segments"]!.map((x) => Segment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "segments": segments == null
            ? []
            : List<dynamic>.from(segments!.map((x) => x.toJson())),
      };
}

class Segment {
  Arrival? departure;
  Arrival? arrival;
  CarrierCode? carrierCode;
  String? number;
  Aircraft? aircraft;
  Operating? operating;
  String? duration;
  String? id;
  int? numberOfStops;
  bool? blacklistedInEu;

  Segment({
    this.departure,
    this.arrival,
    this.carrierCode,
    this.number,
    this.aircraft,
    this.operating,
    this.duration,
    this.id,
    this.numberOfStops,
    this.blacklistedInEu,
  });

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        departure: json["departure"] == null
            ? null
            : Arrival.fromJson(json["departure"]),
        arrival:
            json["arrival"] == null ? null : Arrival.fromJson(json["arrival"]),
        carrierCode: json["carrierCode"]==null?null:carrierCodeValues.map[json["carrierCode"]],
        number: json["number"],
        aircraft: json["aircraft"] == null
            ? null
            : Aircraft.fromJson(json["aircraft"]),
        operating: json["operating"] == null
            ? null
            : Operating.fromJson(json["operating"]),
        duration: json["duration"],
        id: json["id"],
        numberOfStops: json["numberOfStops"],
        blacklistedInEu: json["blacklistedInEU"],
      );

  Map<String, dynamic> toJson() => {
        "departure": departure?.toJson(),
        "arrival": arrival?.toJson(),
        "carrierCode": carrierCodeValues.reverse[carrierCode],
        "number": number,
        "aircraft": aircraft?.toJson(),
        "operating": operating?.toJson(),
        "duration": duration,
        "id": id,
        "numberOfStops": numberOfStops,
        "blacklistedInEU": blacklistedInEu,
      };
}

class Aircraft {
  String? code;

  Aircraft({
    this.code,
  });

  factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}

class Arrival {
  Code? iataCode;
  String? terminal;
  DateTime? at;

  Arrival({
    this.iataCode,
    this.terminal,
    this.at,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        iataCode:json["iataCode"]==null?null: codeValues.map[json["iataCode"]],
        terminal: json["terminal"],
        at: json["at"] == null ? null : DateTime.parse(json["at"]),
      );

  Map<String, dynamic> toJson() => {
        "iataCode": codeValues.reverse[iataCode],
        "terminal": terminal,
        "at": at?.toIso8601String(),
      };
}

enum Code { BKK, DMK, DPS, MNL, SYD, XMN }

final codeValues = EnumValues({
  "BKK": Code.BKK,
  "DMK": Code.DMK,
  "DPS": Code.DPS,
  "MNL": Code.MNL,
  "SYD": Code.SYD,
  "XMN": Code.XMN
});

enum CarrierCode { ID, MF, OD, PR }

final carrierCodeValues = EnumValues({
  "ID": CarrierCode.ID,
  "MF": CarrierCode.MF,
  "OD": CarrierCode.OD,
  "PR": CarrierCode.PR
});

class Operating {
  CarrierCode? carrierCode;

  Operating({
    this.carrierCode,
  });

  factory Operating.fromJson(Map<String, dynamic> json) => Operating(
        carrierCode: json["carrierCode"]==null?null:carrierCodeValues.map[json["carrierCode"]],
      );

  Map<String, dynamic> toJson() => {
        "carrierCode": carrierCodeValues.reverse[carrierCode],
      };
}

class DatumPrice {
  Currency? currency;
  String? total;
  String? base;
  List<Fee>? fees;
  String? grandTotal;

  DatumPrice({
    this.currency,
    this.total,
    this.base,
    this.fees,
    this.grandTotal,
  });

  factory DatumPrice.fromJson(Map<String, dynamic> json) => DatumPrice(
        currency: currencyValues.map[json["currency"]]!,
        total: json["total"],
        base: json["base"],
        fees: json["fees"] == null
            ? []
            : List<Fee>.from(json["fees"]!.map((x) => Fee.fromJson(x))),
        grandTotal: json["grandTotal"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currencyValues.reverse[currency],
        "total": total,
        "base": base,
        "fees": fees == null
            ? []
            : List<dynamic>.from(fees!.map((x) => x.toJson())),
        "grandTotal": grandTotal,
      };
}

enum Currency { EUR }

final currencyValues = EnumValues({"EUR": Currency.EUR});

class Fee {
  String? amount;
  Type? type;

  Fee({
    this.amount,
    this.type,
  });

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        amount: json["amount"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "type": typeValues.reverse[type],
      };
}

enum Type { SUPPLIER, TICKETING }

final typeValues =
    EnumValues({"SUPPLIER": Type.SUPPLIER, "TICKETING": Type.TICKETING});

class PricingOptions {
  List<String>? fareType;
  bool? includedCheckedBagsOnly;

  PricingOptions({
    this.fareType,
    this.includedCheckedBagsOnly,
  });

  factory PricingOptions.fromJson(Map<String, dynamic> json) => PricingOptions(
        fareType: json["fareType"] == null
            ? []
            : List<String>.from(json["fareType"]!.map((x) => x)),
        includedCheckedBagsOnly: json["includedCheckedBagsOnly"],
      );

  Map<String, dynamic> toJson() => {
        "fareType":
            fareType == null ? [] : List<dynamic>.from(fareType!.map((x) => x)),
        "includedCheckedBagsOnly": includedCheckedBagsOnly,
      };
}

class TravelerPricing {
  String? travelerId;
  FareOption? fareOption;
  TravelerType? travelerType;
  TravelerPricingPrice? price;
  List<FareDetailsBySegment>? fareDetailsBySegment;

  TravelerPricing({
    this.travelerId,
    this.fareOption,
    this.travelerType,
    this.price,
    this.fareDetailsBySegment,
  });

  factory TravelerPricing.fromJson(Map<String, dynamic> json) =>
      TravelerPricing(
        travelerId: json["travelerId"],
        fareOption: fareOptionValues.map[json["fareOption"]]!,
        travelerType: travelerTypeValues.map[json["travelerType"]]!,
        price: json["price"] == null
            ? null
            : TravelerPricingPrice.fromJson(json["price"]),
        fareDetailsBySegment: json["fareDetailsBySegment"] == null
            ? []
            : List<FareDetailsBySegment>.from(json["fareDetailsBySegment"]!
                .map((x) => FareDetailsBySegment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "travelerId": travelerId,
        "fareOption": fareOptionValues.reverse[fareOption],
        "travelerType": travelerTypeValues.reverse[travelerType],
        "price": price?.toJson(),
        "fareDetailsBySegment": fareDetailsBySegment == null
            ? []
            : List<dynamic>.from(fareDetailsBySegment!.map((x) => x.toJson())),
      };
}

class FareDetailsBySegment {
  String? segmentId;
  Cabin? cabin;
  FareBasis? fareBasis;
  Class? fareDetailsBySegmentClass;
  IncludedCheckedBags? includedCheckedBags;
  BrandedFare? brandedFare;
  BrandedFareLabel? brandedFareLabel;
  List<Amenity>? amenities;

  FareDetailsBySegment({
    this.segmentId,
    this.cabin,
    this.fareBasis,
    this.fareDetailsBySegmentClass,
    this.includedCheckedBags,
    this.brandedFare,
    this.brandedFareLabel,
    this.amenities,
  });

  factory FareDetailsBySegment.fromJson(Map<String, dynamic> json) =>
      FareDetailsBySegment(
        segmentId: json["segmentId"],
        cabin: cabinValues.map[json["cabin"]]!,
        fareBasis:json["fareBasis"]==null?null:fareBasisValues.map[json["fareBasis"]],
        fareDetailsBySegmentClass: json["class"]==null?null:classValues.map[json["class"]],
        includedCheckedBags: json["includedCheckedBags"] == null
            ? null
            : IncludedCheckedBags.fromJson(json["includedCheckedBags"]),
        brandedFare:json["brandedFare"]==null?null: brandedFareValues.map[json["brandedFare"]]!,
        brandedFareLabel:json["brandedFareLabel"]==null?null: brandedFareLabelValues.map[json["brandedFareLabel"]]!,
        amenities: json["amenities"] == null
            ? []
            : List<Amenity>.from(
                json["amenities"]!.map((x) => Amenity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "segmentId": segmentId,
        "cabin": cabinValues.reverse[cabin],
        "fareBasis": fareBasisValues.reverse[fareBasis],
        "class": classValues.reverse[fareDetailsBySegmentClass],
        "includedCheckedBags": includedCheckedBags?.toJson(),
        "brandedFare": brandedFareValues.reverse[brandedFare],
        "brandedFareLabel": brandedFareLabelValues.reverse[brandedFareLabel],
        "amenities": amenities == null
            ? []
            : List<dynamic>.from(amenities!.map((x) => x.toJson())),
      };
}

class Amenity {
  Description? description;
  bool? isChargeable;
  AmenityType? amenityType;
  AmenityProvider? amenityProvider;

  Amenity({
    this.description,
    this.isChargeable,
    this.amenityType,
    this.amenityProvider,
  });

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        description: descriptionValues.map[json["description"]]!,
        isChargeable: json["isChargeable"],
        amenityType: amenityTypeValues.map[json["amenityType"]]!,
        amenityProvider: json["amenityProvider"] == null
            ? null
            : AmenityProvider.fromJson(json["amenityProvider"]),
      );

  Map<String, dynamic> toJson() => {
        "description": descriptionValues.reverse[description],
        "isChargeable": isChargeable,
        "amenityType": amenityTypeValues.reverse[amenityType],
        "amenityProvider": amenityProvider?.toJson(),
      };
}

class AmenityProvider {
  Name? name;

  AmenityProvider({
    this.name,
  });

  factory AmenityProvider.fromJson(Map<String, dynamic> json) =>
      AmenityProvider(
        name: nameValues.map[json["name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
      };
}

enum Name { BRANDED_FARE }

final nameValues = EnumValues({"BrandedFare": Name.BRANDED_FARE});

enum AmenityType { BAGGAGE, BRANDED_FARES }

final amenityTypeValues = EnumValues({
  "BAGGAGE": AmenityType.BAGGAGE,
  "BRANDED_FARES": AmenityType.BRANDED_FARES
});

enum Description {
  CHANGEABLE_TICKET,
  CHECKED_BAG_1_PC_OF_23_KG_158_CM,
  REFUNDABLE_TICKET
}

final descriptionValues = EnumValues({
  "CHANGEABLE  TICKET": Description.CHANGEABLE_TICKET,
  "CHECKED BAG 1PC OF 23KG 158CM": Description.CHECKED_BAG_1_PC_OF_23_KG_158_CM,
  "REFUNDABLE  TICKET": Description.REFUNDABLE_TICKET
});

enum BrandedFare { YSTANDARD }

final brandedFareValues = EnumValues({"YSTANDARD": BrandedFare.YSTANDARD});

enum BrandedFareLabel { ECONOMY_STANDARD }

final brandedFareLabelValues =
    EnumValues({"ECONOMY STANDARD": BrandedFareLabel.ECONOMY_STANDARD});

enum Cabin { ECONOMY }

final cabinValues = EnumValues({"ECONOMY": Cabin.ECONOMY});

enum FareBasis { S3_M6_AAUS, TBAU, XRTAU, XRTID }

final fareBasisValues = EnumValues({
  "S3M6AAUS": FareBasis.S3_M6_AAUS,
  "TBAU": FareBasis.TBAU,
  "XRTAU": FareBasis.XRTAU,
  "XRTID": FareBasis.XRTID
});

enum Class { S, T, X }

final classValues = EnumValues({"S": Class.S, "T": Class.T, "X": Class.X});

class IncludedCheckedBags {
  int? weight;
  WeightUnit? weightUnit;
  int? quantity;

  IncludedCheckedBags({
    this.weight,
    this.weightUnit,
    this.quantity,
  });

  factory IncludedCheckedBags.fromJson(Map<String, dynamic> json) =>
      IncludedCheckedBags(
        weight: json["weight"],
        weightUnit: json["weightUnit"]==null?null:weightUnitValues.map[json["weightUnit"]]!,
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "weight": weight,
        "weightUnit": weightUnitValues.reverse[weightUnit],
        "quantity": quantity,
      };
}

enum WeightUnit { KG }

final weightUnitValues = EnumValues({"KG": WeightUnit.KG});

enum FareOption { STANDARD }

final fareOptionValues = EnumValues({"STANDARD": FareOption.STANDARD});

class TravelerPricingPrice {
  Currency? currency;
  String? total;
  String? base;

  TravelerPricingPrice({
    this.currency,
    this.total,
    this.base,
  });

  factory TravelerPricingPrice.fromJson(Map<String, dynamic> json) =>
      TravelerPricingPrice(
        currency: currencyValues.map[json["currency"]]!,
        total: json["total"],
        base: json["base"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currencyValues.reverse[currency],
        "total": total,
        "base": base,
      };
}

enum TravelerType { ADULT }

final travelerTypeValues = EnumValues({"ADULT": TravelerType.ADULT});

class Dictionaries {
  Map<String, Location>? locations;
  Map<String, String>? aircraft;
  Currencies? currencies;
  Carriers? carriers;

  Dictionaries({
    this.locations,
    this.aircraft,
    this.currencies,
    this.carriers,
  });

  factory Dictionaries.fromJson(Map<String, dynamic> json) => Dictionaries(
        locations: Map.from(json["locations"]!)
            .map((k, v) => MapEntry<String, Location>(k, Location.fromJson(v))),
        aircraft: Map.from(json["aircraft"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        currencies: json["currencies"] == null
            ? null
            : Currencies.fromJson(json["currencies"]),
        carriers: json["carriers"] == null
            ? null
            : Carriers.fromJson(json["carriers"]),
      );

  Map<String, dynamic> toJson() => {
        "locations": Map.from(locations!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "aircraft":
            Map.from(aircraft!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "currencies": currencies?.toJson(),
        "carriers": carriers?.toJson(),
      };
}

class Carriers {
  String? pr;
  String? od;
  String? mf;
  String? id;

  Carriers({
    this.pr,
    this.od,
    this.mf,
    this.id,
  });

  factory Carriers.fromJson(Map<String, dynamic> json) => Carriers(
        pr: json["PR"],
        od: json["OD"],
        mf: json["MF"],
        id: json["ID"],
      );

  Map<String, dynamic> toJson() => {
        "PR": pr,
        "OD": od,
        "MF": mf,
        "ID": id,
      };
}

class Currencies {
  String? eur;

  Currencies({
    this.eur,
  });

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        eur: json["EUR"],
      );

  Map<String, dynamic> toJson() => {
        "EUR": eur,
      };
}

class Location {
  Code? cityCode;
  String? countryCode;

  Location({
    this.cityCode,
    this.countryCode,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        cityCode: json["cityCode"]==null?null:codeValues.map[json["cityCode"]],
        countryCode: json["countryCode"],
      );

  Map<String, dynamic> toJson() => {
        "cityCode": codeValues.reverse[cityCode],
        "countryCode": countryCode,
      };
}

class Meta {
  int? count;
  Links? links;

  Meta({
    this.count,
    this.links,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        count: json["count"],
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "links": links?.toJson(),
      };
}

class Links {
  String? self;

  Links({
    this.self,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
