// To parse this JSON data, do
//
//     final paymentEntity = paymentEntityFromJson(jsonString);

import 'dart:convert';


String paymentEntityToJson(PaymentEntity data) => json.encode(data.toJson());

abstract class PaymentEntity {
  String? id;
  String? object;
  DateTime? apiVersion;
  int? created;
  Data? data;
  bool? livemode;
  int? pendingWebhooks;
  dynamic request;
  String? type;

  PaymentEntity({
   required this.id,
    required  this.object,
    required   this.apiVersion,
    required   this.created,
    required   this.data,
    required   this.livemode,
    required   this.pendingWebhooks,
    required   this.request,
    required   this.type,
  });


  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "api_version": "${apiVersion!.year.toString().padLeft(4, '0')}-${apiVersion!.month.toString().padLeft(2, '0')}-${apiVersion!.day.toString().padLeft(2, '0')}",
    "created": created,
    "data": data?.toJson(),
    "livemode": livemode,
    "pending_webhooks": pendingWebhooks,
    "request": request,
    "type": type,
  };
}

class Data {
  Object? object;

  Data({
    this.object,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    object: json["object"] == null ? null : Object.fromJson(json["object"]),
  );

  Map<String, dynamic> toJson() => {
    "object": object?.toJson(),
  };
}

class Object {
  String? id;
  String? object;
  int? amount;
  String? currency;
  String? status;
  String? paymentMethod;
  String? customer;

  Object({
    this.id,
    this.object,
    this.amount,
    this.currency,
    this.status,
    this.paymentMethod,
    this.customer,
  });

  factory Object.fromJson(Map<String, dynamic> json) => Object(
    id: json["id"],
    object: json["object"],
    amount: json["amount"],
    currency: json["currency"],
    status: json["status"],
    paymentMethod: json["payment_method"],
    customer: json["customer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "amount": amount,
    "currency": currency,
    "status": status,
    "payment_method": paymentMethod,
    "customer": customer,
  };
}
