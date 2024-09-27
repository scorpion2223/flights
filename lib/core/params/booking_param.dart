// To parse this JSON data, do
//
//     final bookingParam = bookingParamFromJson(jsonString);


import 'dart:convert';

import 'package:flightes/main.dart';


String bookingParamToJson(BookingParam data) => json.encode(data.toJson());

class BookingParam {
  int? userId;
  int? documentId;
  DateTime? reservationDate;
  DateTime? expireReserveDate;
  String? flightStatus;
  String? source;
  bool? instantTicketingRequired;
  bool? nonHomogeneous;
  bool? oneWay;
  DateTime? lastTicketingDate;
  DateTime? lastTicketingDateTime;
  int? numberOfBookableSeats;
  List<Itinerary>? itineraries;
  Price? price;

  BookingParam(
    this.userId,
    this.documentId,
    this.reservationDate,
    this.expireReserveDate,
    this.flightStatus,
    this.source,
    this.instantTicketingRequired,
    this.nonHomogeneous,
    this.oneWay,
    this.lastTicketingDate,
    this.lastTicketingDateTime,
    this.numberOfBookableSeats,
    this.itineraries,
    this.price,
  );
  factory BookingParam.newParam(){
    return BookingParam(
        userID,
        null,
        DateTime.now(),
        DateTime.now(),
        null,
        null,
        false,
        false,
        false,
        DateTime.now(),
        DateTime.now(),
        null,
        [],
        Price());
  }

  BookingParam copyWith({
    int? userId,
    int? documentId,
    DateTime? reservationDate,
    DateTime? expireReserveDate,
    String? flightStatus,
    String? source,
    bool? instantTicketingRequired,
    bool? nonHomogeneous,
    bool? oneWay,
    DateTime? lastTicketingDate,
    DateTime? lastTicketingDateTime,
    int? numberOfBookableSeats,
    List<Itinerary>? itineraries,
    Price? price,
  }) =>
      BookingParam(
         userId ?? this.userId,
   documentId ?? this.documentId,
      reservationDate ?? this.reservationDate,
        expireReserveDate ?? this.expireReserveDate,
 flightStatus ?? this.flightStatus,
         source ?? this.source,
     instantTicketingRequired ?? this.instantTicketingRequired,
     nonHomogeneous ?? this.nonHomogeneous,
      oneWay ?? this.oneWay,
         lastTicketingDate ?? this.lastTicketingDate,
         lastTicketingDateTime ?? this.lastTicketingDateTime,
         numberOfBookableSeats ?? this.numberOfBookableSeats,
         itineraries ?? this.itineraries,
         price ?? this.price,
      );



  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "document_id": documentId,
    "reservation_date": "${reservationDate!.year.toString().padLeft(4, '0')}-${reservationDate!.month.toString().padLeft(2, '0')}-${reservationDate!.day.toString().padLeft(2, '0')}",
    "expire_reserve_date": "${expireReserveDate!.year.toString().padLeft(4, '0')}-${expireReserveDate!.month.toString().padLeft(2, '0')}-${expireReserveDate!.day.toString().padLeft(2, '0')}",
    "flight_status": flightStatus,
    "source": source,
    "instantTicketingRequired": instantTicketingRequired,
    "nonHomogeneous": nonHomogeneous,
    "oneWay": oneWay,
    "lastTicketingDate": "${lastTicketingDate!.year.toString().padLeft(4, '0')}-${lastTicketingDate!.month.toString().padLeft(2, '0')}-${lastTicketingDate!.day.toString().padLeft(2, '0')}",
    "lastTicketingDateTime": "${lastTicketingDateTime!.year.toString().padLeft(4, '0')}-${lastTicketingDateTime!.month.toString().padLeft(2, '0')}-${lastTicketingDateTime!.day.toString().padLeft(2, '0')}",
    "numberOfBookableSeats": numberOfBookableSeats,
    "itineraries": itineraries == null ? [] : List<dynamic>.from(itineraries!.map((x) => x.toJson())),
    "price": price?.toJson(),
  };
}

class Itinerary {
  String? duration;
  List<Segment>? segments;

  Itinerary({
    this.duration,
    this.segments,
  });

  Itinerary copyWith({
    String? duration,
    List<Segment>? segments,
  }) =>
      Itinerary(
        duration: duration ?? this.duration,
        segments: segments ?? this.segments,
      );

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
    duration: json["duration"],
    segments: json["segments"] == null ? [] : List<Segment>.from(json["segments"]!.map((x) => Segment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "duration": duration,
    "segments": segments == null ? [] : List<dynamic>.from(segments!.map((x) => x.toJson())),
  };
}

class Segment {
  Arrival? departure;
  Arrival? arrival;

  Segment({
    this.departure,
    this.arrival,
  });

  Segment copyWith({
    Arrival? departure,
    Arrival? arrival,
  }) =>
      Segment(
        departure: departure ?? this.departure,
        arrival: arrival ?? this.arrival,
      );

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
    departure: json["departure"] == null ? null : Arrival.fromJson(json["departure"]),
    arrival: json["arrival"] == null ? null : Arrival.fromJson(json["arrival"]),
  );

  Map<String, dynamic> toJson() => {
    "departure": departure?.toJson(),
    "arrival": arrival?.toJson(),
  };
}

class Arrival {
  String? iataCode;
  DateTime? at;

  Arrival({
    this.iataCode,
    this.at,
  });

  Arrival copyWith({
    String? iataCode,
    DateTime? at,
  }) =>
      Arrival(
        iataCode: iataCode ?? this.iataCode,
        at: at ?? this.at,
      );

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
    iataCode: json["iataCode"],
    at: json["at"] == null ? null : DateTime.parse(json["at"]),
  );

  Map<String, dynamic> toJson() => {
    "iataCode": iataCode,
    "at": at?.toIso8601String(),
  };
}

class Price {
  String? currency;
  String? total;
  String? base;
  List<Fee>? fees;
  String? grandTotal;

  Price({
    this.currency,
    this.total,
    this.base,
    this.fees,
    this.grandTotal,
  });

  Price copyWith({
    String? currency,
    String? total,
    String? base,
    List<Fee>? fees,
    String? grandTotal,
  }) =>
      Price(
        currency: currency ?? this.currency,
        total: total ?? this.total,
        base: base ?? this.base,
        fees: fees ?? this.fees,
        grandTotal: grandTotal ?? this.grandTotal,
      );

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    currency: json["currency"],
    total: json["total"],
    base: json["base"],
    fees: json["fees"] == null ? [] : List<Fee>.from(json["fees"]!.map((x) => Fee.fromJson(x))),
    grandTotal: json["grandTotal"],
  );

  Map<String, dynamic> toJson() => {
    "currency": currency,
    "total": total,
    "base": base,
    "fees": fees == null ? [] : List<dynamic>.from(fees!.map((x) => x.toJson())),
    "grandTotal": grandTotal,
  };
}

class Fee {
  String? amount;
  String? type;

  Fee({
    this.amount,
    this.type,
  });

  Fee copyWith({
    String? amount,
    String? type,
  }) =>
      Fee(
        amount: amount ?? this.amount,
        type: type ?? this.type,
      );

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
    amount: json["amount"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "type": type,
  };
}
