import 'package:flightes/core/params/booking_new_param.dart';
import 'package:flightes/core/params/validators_param.dart';
import 'package:flightes/main.dart';

import '../utils/constatnts/countries_cities_postals.dart';
import '../utils/constatnts/country_mobile_phone_code.dart';

class ContactParam extends ValidatorsParam{
  int ?userId;
  String?addressFirstName;
  String?addressLastName;
  String?companyName;
  String?purpose;
  String?emailAddress;
  String?addressLines;
  String?addressPostalCode;
  String?addressCityName;
  String?addressCountryCode;
  Phones phones;
  ContactParam(
      this.userId,
      this.addressFirstName,
      this.addressLastName,
      this.companyName,
      this.purpose,
      this.emailAddress,
      this.addressLines,
      this.addressPostalCode,
      this.addressCityName,
      this.addressCountryCode,
      this.phones
      );
  
  factory ContactParam.newParam(){
    return ContactParam(userID, null, null, null, null, null, null, countries.first.cities.first.postalCode, countries.first.cities.first.name, countries.first.name, Phones.newParam());
  }

  ContactParam copyWith({
    int ?userId,
    String?addressFirstName,
    String?addressLastName,
    String?companyName,
    String?purpose,
    String?emailAddress,
    String?addressLines,
    String?addressPostalCode,
    String?addressCityName,
    String?addressCountryCode,
    Phones? phones,
}){
    return ContactParam(
        userId??this.userId, addressFirstName??this.addressFirstName, addressLastName??this.addressLastName,
        companyName??this.companyName, purpose??this.purpose, emailAddress??this.emailAddress,
        addressLines??this.addressLines, addressPostalCode??this.addressPostalCode,
        addressCityName??this.addressCityName, addressCountryCode??this.addressFirstName,
        phones??this.phones);
}

Map<String,dynamic> toJson(List<dynamic>? phonesContact){
    return {
        "user_id": userId,
        "addresseeName": {
        "firstName": addressFirstName,
        "lastName": addressLastName
      },
      "companyName": companyName,
      "purpose": purpose,
      "emailAddress": emailAddress,
      "address": {
          "lines": [addressLines],
        "postalCode": addressPostalCode,
        "cityName": addressCityName,
        "countryCode": addressCountryCode
      },
      "phones": [phones.toJson()]
    }
;

}
}

class Phones{
  String?deviceType;
  String?countryCallingCode;
  String?number;
  Phones(
      this.deviceType,
      this.countryCallingCode,
      this.number,
      );
  
  factory Phones.newParam(){
return Phones("Mobile", mobileCountryCodes.first, null);
  }

  Map<String,dynamic> toJson(){
    return {
      "deviceType": deviceType,
      "countryCallingCode": countryCallingCode,
      "number": number
    };
  }
Phones copyWith({
  String?deviceType,
  String?countryCallingCode,
  String?number,
}){
    return Phones(deviceType??this.deviceType, countryCallingCode??this.countryCallingCode, number??this.number);
}


}