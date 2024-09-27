import 'package:flightes/feature/payment/domain/entities/payment_entity.dart';

class PaymentModel extends PaymentEntity{
  PaymentModel({required super.id, required super.object, required super.apiVersion, required super.created, required super.data, required super.livemode, required super.pendingWebhooks, required super.request, required super.type});
  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    id: json["id"],
    object: json["object"],
    apiVersion: json["api_version"] == null ? null : DateTime.parse(json["api_version"]),
    created: json["created"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    livemode: json["livemode"],
    pendingWebhooks: json["pending_webhooks"],
    request: json["request"],
    type: json["type"],
  );

}