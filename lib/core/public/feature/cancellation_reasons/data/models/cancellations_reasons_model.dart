import 'package:flightes/core/public/feature/cancellation_reasons/domain/entities/cancellation_reasons_entity.dart';

class CancellationsReasonsModel extends CancellationReasonsEntity{
  CancellationsReasonsModel({required super.data});

  factory CancellationsReasonsModel.fromJson(Map<String, dynamic> json) => CancellationsReasonsModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),


  );

}