import 'package:flightes/core/config/injections/injections.dart' as di;
import 'package:flightes/core/params/validators_param.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class AddressParam extends ValidatorsParam{
  int? userId;
  int? countryId;
  int? cityId;
  String? area;
  String? street;
  String? building;
  String? landmark;

  AddressParam(this.userId, this.countryId, this.cityId, this.area, this.street,
      this.building, this.landmark);

  factory AddressParam.newParam() {
    return AddressParam(userID, null, null,
        null, null, null, null);
  }

  Map<String,dynamic> toJson(){
    return {

      "user_id":userId,
      "city_id":cityId,
      "country_id":countryId,
      "area":area,
      "street":street,
      "building":building,
      "landmark":landmark
    };
  }

  AddressParam copyWith({
    int? userId,
    int? countryId,
    int? cityId,
    String? area,
    String? street,
    String? building,
    String? landmark,
  }) {
    return AddressParam(userId ?? this.userId, countryId ?? this.countryId,
        cityId ?? this.cityId, area ?? this.area, street??this.street, building??this.building, landmark??this.landmark);
  }
}
