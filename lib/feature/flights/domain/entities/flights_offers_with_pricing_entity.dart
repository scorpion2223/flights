// To parse this JSON data, do
//
//     final flightsOffersWithPricingEntity = flightsOffersWithPricingEntityFromJson(jsonString);

import 'dart:convert';


String flightsOffersWithPricingEntityToJson(FlightsOffersWithPricingEntity data) => json.encode(data.toJson());

abstract class FlightsOffersWithPricingEntity {
  FlightsOffersWithPricingEntityData? data;

  FlightsOffersWithPricingEntity({
    required this.data,
  });

  // FlightsOffersWithPricingEntity copyWith({
  //   FlightsOffersWithPricingEntityData? data,
  // }) =>
  //     FlightsOffersWithPricingEntity(
  //       data: data ?? this.data,
  //     );


  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class FlightsOffersWithPricingEntityData {
  Headers? headers;
  Original? original;
  dynamic exception;

  FlightsOffersWithPricingEntityData({
    this.headers,
    this.original,
    this.exception,
  });

  FlightsOffersWithPricingEntityData copyWith({
    Headers? headers,
    Original? original,
    dynamic exception,
  }) =>
      FlightsOffersWithPricingEntityData(
        headers: headers ?? this.headers,
        original: original ?? this.original,
        exception: exception ?? this.exception,
      );

  factory FlightsOffersWithPricingEntityData.fromJson(Map<String, dynamic> json) => FlightsOffersWithPricingEntityData(
    headers: json["headers"] == null ? null : Headers.fromJson(json["headers"]),
    original: json["original"] == null ? null : Original.fromJson(json["original"]),
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



factory Headers.fromJson(Map<String, dynamic> json) => Headers(
);

Map<String, dynamic> toJson() => {
};
}

class Original {
OriginalData? data;
Dictionaries? dictionaries;
List<dynamic> ? errors;
dynamic error;

Original({
this.data,
this.dictionaries,
  this.errors,
  this.error,
});

Original copyWith({
OriginalData? data,
Dictionaries? dictionaries,
}) =>
Original(
data: data ?? this.data,
dictionaries: dictionaries ?? this.dictionaries,
);

factory Original.fromJson(Map<String, dynamic> json) => Original(
data: json["data"] == null ? null : OriginalData.fromJson(json["data"]),
dictionaries: json["dictionaries"] == null ? null : Dictionaries.fromJson(json["dictionaries"]),
  errors: json["errors"] ,
  error: json["error"]
);

Map<String, dynamic> toJson() => {
"data": data?.toJson(),
"dictionaries": dictionaries?.toJson(),
};
}

class OriginalData {
String? type;
List<FlightOffer>? flightOffers;
BookingRequirements? bookingRequirements;

OriginalData({
this.type,
this.flightOffers,
this.bookingRequirements,
});

OriginalData copyWith({
String? type,
List<FlightOffer>? flightOffers,
BookingRequirements? bookingRequirements,
}) =>
OriginalData(
type: type ?? this.type,
flightOffers: flightOffers ?? this.flightOffers,
bookingRequirements: bookingRequirements ?? this.bookingRequirements,
);

factory OriginalData.fromJson(Map<String, dynamic> json) => OriginalData(
type: json["type"],
flightOffers: json["flightOffers"] == null ? [] : List<FlightOffer>.from(json["flightOffers"]!.map((x) => FlightOffer.fromJson(x))),
bookingRequirements: json["bookingRequirements"] == null ? null : BookingRequirements.fromJson(json["bookingRequirements"]),
);

Map<String, dynamic> toJson() => {
"type": type,
"flightOffers": flightOffers == null ? [] : List<dynamic>.from(flightOffers!.map((x) => x.toJson())),
"bookingRequirements": bookingRequirements?.toJson(),
};
}

class BookingRequirements {
bool? emailAddressRequired;
bool? mobilePhoneNumberRequired;
List<TravelerRequirement>? travelerRequirements;

BookingRequirements({
this.emailAddressRequired,
this.mobilePhoneNumberRequired,
this.travelerRequirements,
});

BookingRequirements copyWith({
bool? emailAddressRequired,
bool? mobilePhoneNumberRequired,
List<TravelerRequirement>? travelerRequirements,
}) =>
BookingRequirements(
emailAddressRequired: emailAddressRequired ?? this.emailAddressRequired,
mobilePhoneNumberRequired: mobilePhoneNumberRequired ?? this.mobilePhoneNumberRequired,
travelerRequirements: travelerRequirements ?? this.travelerRequirements,
);

factory BookingRequirements.fromJson(Map<String, dynamic> json) => BookingRequirements(
emailAddressRequired: json["emailAddressRequired"],
mobilePhoneNumberRequired: json["mobilePhoneNumberRequired"],
travelerRequirements: json["travelerRequirements"] == null ? [] : List<TravelerRequirement>.from(json["travelerRequirements"]!.map((x) => TravelerRequirement.fromJson(x))),
);

Map<String, dynamic> toJson() => {
"emailAddressRequired": emailAddressRequired,
"mobilePhoneNumberRequired": mobilePhoneNumberRequired,
"travelerRequirements": travelerRequirements == null ? [] : List<dynamic>.from(travelerRequirements!.map((x) => x.toJson())),
};
}

class TravelerRequirement {
String? travelerId;
bool? documentRequired;

TravelerRequirement({
this.travelerId,
this.documentRequired,
});

TravelerRequirement copyWith({
String? travelerId,
bool? documentRequired,
}) =>
TravelerRequirement(
travelerId: travelerId ?? this.travelerId,
documentRequired: documentRequired ?? this.documentRequired,
);

factory TravelerRequirement.fromJson(Map<String, dynamic> json) => TravelerRequirement(
travelerId: json["travelerId"],
documentRequired: json["documentRequired"],
);

Map<String, dynamic> toJson() => {
"travelerId": travelerId,
"documentRequired": documentRequired,
};
}

class FlightOffer {
String? type;
String? id;
String? source;
bool? instantTicketingRequired;
bool? nonHomogeneous;
bool? paymentCardRequired;
DateTime? lastTicketingDate;
List<Itinerary>? itineraries;
FlightOfferPrice? price;
PricingOptions? pricingOptions;
List<String>? validatingAirlineCodes;
List<TravelerPricing>? travelerPricings;

FlightOffer({
this.type,
this.id,
this.source,
this.instantTicketingRequired,
this.nonHomogeneous,
this.paymentCardRequired,
this.lastTicketingDate,
this.itineraries,
this.price,
this.pricingOptions,
this.validatingAirlineCodes,
this.travelerPricings,
});

FlightOffer copyWith({
String? type,
String? id,
String? source,
bool? instantTicketingRequired,
bool? nonHomogeneous,
bool? paymentCardRequired,
DateTime? lastTicketingDate,
List<Itinerary>? itineraries,
FlightOfferPrice? price,
PricingOptions? pricingOptions,
List<String>? validatingAirlineCodes,
List<TravelerPricing>? travelerPricings,
}) =>
FlightOffer(
type: type ?? this.type,
id: id ?? this.id,
source: source ?? this.source,
instantTicketingRequired: instantTicketingRequired ?? this.instantTicketingRequired,
nonHomogeneous: nonHomogeneous ?? this.nonHomogeneous,
paymentCardRequired: paymentCardRequired ?? this.paymentCardRequired,
lastTicketingDate: lastTicketingDate ?? this.lastTicketingDate,
itineraries: itineraries ?? this.itineraries,
price: price ?? this.price,
pricingOptions: pricingOptions ?? this.pricingOptions,
validatingAirlineCodes: validatingAirlineCodes ?? this.validatingAirlineCodes,
travelerPricings: travelerPricings ?? this.travelerPricings,
);

factory FlightOffer.fromJson(Map<String, dynamic> json) => FlightOffer(
type: json["type"],
id: json["id"],
source: json["source"],
instantTicketingRequired: json["instantTicketingRequired"],
nonHomogeneous: json["nonHomogeneous"],
paymentCardRequired: json["paymentCardRequired"],
lastTicketingDate: json["lastTicketingDate"] == null ? null : DateTime.parse(json["lastTicketingDate"]),
itineraries: json["itineraries"] == null ? [] : List<Itinerary>.from(json["itineraries"]!.map((x) => Itinerary.fromJson(x))),
price: json["price"] == null ? null : FlightOfferPrice.fromJson(json["price"]),
pricingOptions: json["pricingOptions"] == null ? null : PricingOptions.fromJson(json["pricingOptions"]),
validatingAirlineCodes: json["validatingAirlineCodes"] == null ? [] : List<String>.from(json["validatingAirlineCodes"]!.map((x) => x)),
travelerPricings: json["travelerPricings"] == null ? [] : List<TravelerPricing>.from(json["travelerPricings"]!.map((x) => TravelerPricing.fromJson(x))),
);

Map<String, dynamic> toJson() => {
"type": type,
"id": id,
"source": source,
"instantTicketingRequired": instantTicketingRequired,
"nonHomogeneous": nonHomogeneous,
"paymentCardRequired": paymentCardRequired,
"lastTicketingDate": "${lastTicketingDate!.year.toString().padLeft(4, '0')}-${lastTicketingDate!.month.toString().padLeft(2, '0')}-${lastTicketingDate!.day.toString().padLeft(2, '0')}",
"itineraries": itineraries == null ? [] : List<dynamic>.from(itineraries!.map((x) => x.toJson())),
"price": price?.toJson(),
"pricingOptions": pricingOptions?.toJson(),
"validatingAirlineCodes": validatingAirlineCodes == null ? [] : List<dynamic>.from(validatingAirlineCodes!.map((x) => x)),
"travelerPricings": travelerPricings == null ? [] : List<dynamic>.from(travelerPricings!.map((x) => x.toJson())),
};
}

class Itinerary {
List<Segment>? segments;

Itinerary({
this.segments,
});

Itinerary copyWith({
List<Segment>? segments,
}) =>
Itinerary(
segments: segments ?? this.segments,
);

factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
segments: json["segments"] == null ? [] : List<Segment>.from(json["segments"]!.map((x) => Segment.fromJson(x))),
);

Map<String, dynamic> toJson() => {
"segments": segments == null ? [] : List<dynamic>.from(segments!.map((x) => x.toJson())),
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
List<Co2Emission>? co2Emissions;
List<Stop>? stops;

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
this.co2Emissions,
this.stops,
});

Segment copyWith({
Arrival? departure,
Arrival? arrival,
CarrierCode? carrierCode,
String? number,
Aircraft? aircraft,
Operating? operating,
String? duration,
String? id,
int? numberOfStops,
List<Co2Emission>? co2Emissions,
List<Stop>? stops,
}) =>
Segment(
departure: departure ?? this.departure,
arrival: arrival ?? this.arrival,
carrierCode: carrierCode ?? this.carrierCode,
number: number ?? this.number,
aircraft: aircraft ?? this.aircraft,
operating: operating ?? this.operating,
duration: duration ?? this.duration,
id: id ?? this.id,
numberOfStops: numberOfStops ?? this.numberOfStops,
co2Emissions: co2Emissions ?? this.co2Emissions,
stops: stops ?? this.stops,
);

factory Segment.fromJson(Map<String, dynamic> json) => Segment(
departure: json["departure"] == null ? null : Arrival.fromJson(json["departure"]),
arrival: json["arrival"] == null ? null : Arrival.fromJson(json["arrival"]),
carrierCode:json["carrierCode"]==null?null: carrierCodeValues.map[json["carrierCode"]],
number: json["number"],
aircraft: json["aircraft"] == null ? null : Aircraft.fromJson(json["aircraft"]),
operating: json["operating"] == null ? null : Operating.fromJson(json["operating"]),
duration: json["duration"],
id: json["id"],
numberOfStops: json["numberOfStops"],
co2Emissions: json["co2Emissions"] == null ? [] : List<Co2Emission>.from(json["co2Emissions"]!.map((x) => Co2Emission.fromJson(x))),
stops: json["stops"] == null ? [] : List<Stop>.from(json["stops"]!.map((x) => Stop.fromJson(x))),
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
"co2Emissions": co2Emissions == null ? [] : List<dynamic>.from(co2Emissions!.map((x) => x.toJson())),
"stops": stops == null ? [] : List<dynamic>.from(stops!.map((x) => x.toJson())),
};
}

class Aircraft {
String? code;

Aircraft({
this.code,
});

Aircraft copyWith({
String? code,
}) =>
Aircraft(
code: code ?? this.code,
);

factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
code: json["code"],
);

Map<String, dynamic> toJson() => {
"code": code,
};
}

class Arrival {
Code? iataCode;
DateTime? at;
String? terminal;

Arrival({
this.iataCode,
this.at,
this.terminal,
});

Arrival copyWith({
Code? iataCode,
DateTime? at,
String? terminal,
}) =>
Arrival(
iataCode: iataCode ?? this.iataCode,
at: at ?? this.at,
terminal: terminal ?? this.terminal,
);

factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
iataCode: json["iataCode"]==null?null:codeValues.map[json["iataCode"]],
at: json["at"] == null ? null : DateTime.parse(json["at"]),
terminal: json["terminal"],
);

Map<String, dynamic> toJson() => {
"iataCode": codeValues.reverse[iataCode],
"at": at?.toIso8601String(),
"terminal": terminal,
};
}

enum Code {
BKK,
DMK,
DPS,
KUL,
SYD,
XMN
}

final codeValues = EnumValues({
"BKK": Code.BKK,
"DMK": Code.DMK,
"DPS": Code.DPS,
"KUL": Code.KUL,
"SYD": Code.SYD,
"XMN": Code.XMN
});

enum CarrierCode {
ID,
MF,
OD
}

final carrierCodeValues = EnumValues({
"ID": CarrierCode.ID,
"MF": CarrierCode.MF,
"OD": CarrierCode.OD
});

class Co2Emission {
int? weight;
WeightUnit? weightUnit;
Cabin? cabin;

Co2Emission({
this.weight,
this.weightUnit,
this.cabin,
});

Co2Emission copyWith({
int? weight,
WeightUnit? weightUnit,
Cabin? cabin,
}) =>
Co2Emission(
weight: weight ?? this.weight,
weightUnit: weightUnit ?? this.weightUnit,
cabin: cabin ?? this.cabin,
);

factory Co2Emission.fromJson(Map<String, dynamic> json) => Co2Emission(
weight: json["weight"],
weightUnit: weightUnitValues.map[json["weightUnit"]]!,
cabin: cabinValues.map[json["cabin"]]!,
);

Map<String, dynamic> toJson() => {
"weight": weight,
"weightUnit": weightUnitValues.reverse[weightUnit],
"cabin": cabinValues.reverse[cabin],
};
}

enum Cabin {
ECONOMY
}

final cabinValues = EnumValues({
"ECONOMY": Cabin.ECONOMY
});

enum WeightUnit {
KG
}

final weightUnitValues = EnumValues({
"KG": WeightUnit.KG
});

class Operating {
CarrierCode? carrierCode;

Operating({
this.carrierCode,
});

Operating copyWith({
CarrierCode? carrierCode,
}) =>
Operating(
carrierCode: carrierCode ?? this.carrierCode,
);

factory Operating.fromJson(Map<String, dynamic> json) => Operating(
carrierCode: json["carrierCode"]==null?null:carrierCodeValues.map[json["carrierCode"]],
);

Map<String, dynamic> toJson() => {
"carrierCode": carrierCodeValues.reverse[carrierCode],
};
}

class Stop {
Code? iataCode;
String? duration;
DateTime? arrivalAt;
DateTime? departureAt;

Stop({
this.iataCode,
this.duration,
this.arrivalAt,
this.departureAt,
});

Stop copyWith({
Code? iataCode,
String? duration,
DateTime? arrivalAt,
DateTime? departureAt,
}) =>
Stop(
iataCode: iataCode ?? this.iataCode,
duration: duration ?? this.duration,
arrivalAt: arrivalAt ?? this.arrivalAt,
departureAt: departureAt ?? this.departureAt,
);

factory Stop.fromJson(Map<String, dynamic> json) => Stop(
iataCode: json["iataCode"]==null?null:codeValues.map[json["iataCode"]],
duration: json["duration"],
arrivalAt: json["arrivalAt"] == null ? null : DateTime.parse(json["arrivalAt"]),
departureAt: json["departureAt"] == null ? null : DateTime.parse(json["departureAt"]),
);

Map<String, dynamic> toJson() => {
"iataCode": codeValues.reverse[iataCode],
"duration": duration,
"arrivalAt": arrivalAt?.toIso8601String(),
"departureAt": departureAt?.toIso8601String(),
};
}

class FlightOfferPrice {
Currency? currency;
String? total;
String? base;
List<Fee>? fees;
String? grandTotal;
Currency? billingCurrency;

FlightOfferPrice({
this.currency,
this.total,
this.base,
this.fees,
this.grandTotal,
this.billingCurrency,
});

FlightOfferPrice copyWith({
Currency? currency,
String? total,
String? base,
List<Fee>? fees,
String? grandTotal,
Currency? billingCurrency,
}) =>
FlightOfferPrice(
currency: currency ?? this.currency,
total: total ?? this.total,
base: base ?? this.base,
fees: fees ?? this.fees,
grandTotal: grandTotal ?? this.grandTotal,
billingCurrency: billingCurrency ?? this.billingCurrency,
);

factory FlightOfferPrice.fromJson(Map<String, dynamic> json) => FlightOfferPrice(
currency: json["currency"]==null?null:currencyValues.map[json["currency"]],
total: json["total"],
base: json["base"],
fees: json["fees"] == null ? [] : List<Fee>.from(json["fees"]!.map((x) => Fee.fromJson(x))),
grandTotal: json["grandTotal"],
billingCurrency:json["billingCurrency"]==null?null: currencyValues.map[json["billingCurrency"]],
);

Map<String, dynamic> toJson() => {
"currency": currencyValues.reverse[currency],
"total": total,
"base": base,
"fees": fees == null ? [] : List<dynamic>.from(fees!.map((x) => x.toJson())),
"grandTotal": grandTotal,
"billingCurrency": currencyValues.reverse[billingCurrency],
};
}

enum Currency {
EUR
}

final currencyValues = EnumValues({
"EUR": Currency.EUR
});

class Fee {
String? amount;
Type? type;

Fee({
this.amount,
this.type,
});

Fee copyWith({
String? amount,
Type? type,
}) =>
Fee(
amount: amount ?? this.amount,
type: type ?? this.type,
);

factory Fee.fromJson(Map<String, dynamic> json) => Fee(
amount: json["amount"],
type:json["type"]==null?null: typeValues.map[json["type"]],
);

Map<String, dynamic> toJson() => {
"amount": amount,
"type": typeValues.reverse[type],
};
}

enum Type {
FORM_OF_PAYMENT,
SUPPLIER,
TICKETING
}

final typeValues = EnumValues({
"FORM_OF_PAYMENT": Type.FORM_OF_PAYMENT,
"SUPPLIER": Type.SUPPLIER,
"TICKETING": Type.TICKETING
});

class PricingOptions {
List<String>? fareType;
bool? includedCheckedBagsOnly;

PricingOptions({
this.fareType,
this.includedCheckedBagsOnly,
});

PricingOptions copyWith({
List<String>? fareType,
bool? includedCheckedBagsOnly,
}) =>
PricingOptions(
fareType: fareType ?? this.fareType,
includedCheckedBagsOnly: includedCheckedBagsOnly ?? this.includedCheckedBagsOnly,
);

factory PricingOptions.fromJson(Map<String, dynamic> json) => PricingOptions(
fareType: json["fareType"] == null ? [] : List<String>.from(json["fareType"]!.map((x) => x)),
includedCheckedBagsOnly: json["includedCheckedBagsOnly"],
);

Map<String, dynamic> toJson() => {
"fareType": fareType == null ? [] : List<dynamic>.from(fareType!.map((x) => x)),
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

TravelerPricing copyWith({
String? travelerId,
FareOption? fareOption,
TravelerType? travelerType,
TravelerPricingPrice? price,
List<FareDetailsBySegment>? fareDetailsBySegment,
}) =>
TravelerPricing(
travelerId: travelerId ?? this.travelerId,
fareOption: fareOption ?? this.fareOption,
travelerType: travelerType ?? this.travelerType,
price: price ?? this.price,
fareDetailsBySegment: fareDetailsBySegment ?? this.fareDetailsBySegment,
);

factory TravelerPricing.fromJson(Map<String, dynamic> json) => TravelerPricing(
travelerId: json["travelerId"],
fareOption: json["fareOption"]==null?null:fareOptionValues.map[json["fareOption"]],
travelerType:json["travelerType"] ==null ? null:travelerTypeValues.map[json["travelerType"]],
price: json["price"] == null ? null : TravelerPricingPrice.fromJson(json["price"]),
fareDetailsBySegment: json["fareDetailsBySegment"] == null ? [] : List<FareDetailsBySegment>.from(json["fareDetailsBySegment"]!.map((x) => FareDetailsBySegment.fromJson(x))),
);

Map<String, dynamic> toJson() => {
"travelerId": travelerId,
"fareOption": fareOptionValues.reverse[fareOption],
"travelerType": travelerTypeValues.reverse[travelerType],
"price": price?.toJson(),
"fareDetailsBySegment": fareDetailsBySegment == null ? [] : List<dynamic>.from(fareDetailsBySegment!.map((x) => x.toJson())),
};
}

class FareDetailsBySegment {
String? segmentId;
Cabin? cabin;
FareBasis? fareBasis;
Class? fareDetailsBySegmentClass;
IncludedCheckedBags? includedCheckedBags;
BrandedFare? brandedFare;

FareDetailsBySegment({
this.segmentId,
this.cabin,
this.fareBasis,
this.fareDetailsBySegmentClass,
this.includedCheckedBags,
this.brandedFare,
});

FareDetailsBySegment copyWith({
String? segmentId,
Cabin? cabin,
FareBasis? fareBasis,
Class? fareDetailsBySegmentClass,
IncludedCheckedBags? includedCheckedBags,
BrandedFare? brandedFare,
}) =>
FareDetailsBySegment(
segmentId: segmentId ?? this.segmentId,
cabin: cabin ?? this.cabin,
fareBasis: fareBasis ?? this.fareBasis,
fareDetailsBySegmentClass: fareDetailsBySegmentClass ?? this.fareDetailsBySegmentClass,
includedCheckedBags: includedCheckedBags ?? this.includedCheckedBags,
brandedFare: brandedFare ?? this.brandedFare,
);

factory FareDetailsBySegment.fromJson(Map<String, dynamic> json) => FareDetailsBySegment(
segmentId: json["segmentId"],
cabin:json["cabin"]==null?null: cabinValues.map[json["cabin"]],
fareBasis:json["fareBasis"]==null?null: fareBasisValues.map[json["fareBasis"]],
fareDetailsBySegmentClass:json["class"]==null?null: classValues.map[json["class"]],
includedCheckedBags: json["includedCheckedBags"] == null ? null : IncludedCheckedBags.fromJson(json["includedCheckedBags"]),
brandedFare:json["brandedFare"]==null?null: brandedFareValues.map[json["brandedFare"]],
);

Map<String, dynamic> toJson() => {
"segmentId": segmentId,
"cabin": cabinValues.reverse[cabin],
"fareBasis": fareBasisValues.reverse[fareBasis],
"class": classValues.reverse[fareDetailsBySegmentClass],
"includedCheckedBags": includedCheckedBags?.toJson(),
"brandedFare": brandedFareValues.reverse[brandedFare],
};
}

enum BrandedFare {
YSTANDARD
}

final brandedFareValues = EnumValues({
"YSTANDARD": BrandedFare.YSTANDARD
});

enum FareBasis {
S3_M6_AAUS,
XOWAU,
XOWID,
XOWTH,
XRTAU,
XRTID
}

final fareBasisValues = EnumValues({
"S3M6AAUS": FareBasis.S3_M6_AAUS,
"XOWAU": FareBasis.XOWAU,
"XOWID": FareBasis.XOWID,
"XOWTH": FareBasis.XOWTH,
"XRTAU": FareBasis.XRTAU,
"XRTID": FareBasis.XRTID
});

enum Class {
S,
X
}

final classValues = EnumValues({
"S": Class.S,
"X": Class.X
});

class IncludedCheckedBags {
int? weight;
WeightUnit? weightUnit;
int? quantity;

IncludedCheckedBags({
this.weight,
this.weightUnit,
this.quantity,
});

IncludedCheckedBags copyWith({
int? weight,
WeightUnit? weightUnit,
int? quantity,
}) =>
IncludedCheckedBags(
weight: weight ?? this.weight,
weightUnit: weightUnit ?? this.weightUnit,
quantity: quantity ?? this.quantity,
);

factory IncludedCheckedBags.fromJson(Map<String, dynamic> json) => IncludedCheckedBags(
weight: json["weight"],
weightUnit:json["weightUnit"]==null?null: weightUnitValues.map[json["weightUnit"]],
quantity: json["quantity"],
);

Map<String, dynamic> toJson() => {
"weight": weight,
"weightUnit": weightUnitValues.reverse[weightUnit],
"quantity": quantity,
};
}

enum FareOption {
STANDARD
}

final fareOptionValues = EnumValues({
"STANDARD": FareOption.STANDARD
});

class TravelerPricingPrice {
Currency? currency;
String? total;
String? base;
List<Tax>? taxes;
String? refundableTaxes;

TravelerPricingPrice({
this.currency,
this.total,
this.base,
this.taxes,
this.refundableTaxes,
});

TravelerPricingPrice copyWith({
Currency? currency,
String? total,
String? base,
List<Tax>? taxes,
String? refundableTaxes,
}) =>
TravelerPricingPrice(
currency: currency ?? this.currency,
total: total ?? this.total,
base: base ?? this.base,
taxes: taxes ?? this.taxes,
refundableTaxes: refundableTaxes ?? this.refundableTaxes,
);

factory TravelerPricingPrice.fromJson(Map<String, dynamic> json) => TravelerPricingPrice(
currency:json["currency"]==null?null: currencyValues.map[json["currency"]],
total: json["total"],
base: json["base"],
taxes: json["taxes"] == null ? [] : List<Tax>.from(json["taxes"]!.map((x) => Tax.fromJson(x))),
refundableTaxes: json["refundableTaxes"],
);

Map<String, dynamic> toJson() => {
"currency": currencyValues.reverse[currency],
"total": total,
"base": base,
"taxes": taxes == null ? [] : List<dynamic>.from(taxes!.map((x) => x.toJson())),
"refundableTaxes": refundableTaxes,
};
}

class Tax {
String? amount;
String? code;

Tax({
this.amount,
this.code,
});

Tax copyWith({
String? amount,
String? code,
}) =>
Tax(
amount: amount ?? this.amount,
code: code ?? this.code,
);

factory Tax.fromJson(Map<String, dynamic> json) => Tax(
amount: json["amount"],
code: json["code"],
);

Map<String, dynamic> toJson() => {
"amount": amount,
"code": code,
};
}

enum TravelerType {
ADULT
}

final travelerTypeValues = EnumValues({
"ADULT": TravelerType.ADULT
});

class Dictionaries {
Map<String, Location>? locations;

Dictionaries({
this.locations,
});

Dictionaries copyWith({
Map<String, Location>? locations,
}) =>
Dictionaries(
locations: locations ?? this.locations,
);

factory Dictionaries.fromJson(Map<String, dynamic> json) => Dictionaries(
locations: Map.from(json["locations"]!).map((k, v) => MapEntry<String, Location>(k, Location.fromJson(v))),
);

Map<String, dynamic> toJson() => {
"locations": Map.from(locations!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
};
}

class Location {
Code? cityCode;
String? countryCode;

Location({
this.cityCode,
this.countryCode,
});

Location copyWith({
Code? cityCode,
String? countryCode,
}) =>
Location(
cityCode: cityCode ?? this.cityCode,
countryCode: countryCode ?? this.countryCode,
);

factory Location.fromJson(Map<String, dynamic> json) => Location(
cityCode: json["cityCode"]==null?null:codeValues.map[json["cityCode"]],
countryCode: json["countryCode"],
);

Map<String, dynamic> toJson() => {
"cityCode": codeValues.reverse[cityCode],
"countryCode": countryCode,
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
