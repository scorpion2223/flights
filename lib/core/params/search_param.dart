import 'package:flightes/core/utils/extensions/string_extension.dart';
import 'package:intl/intl.dart';

class SearchParam {
   String? originLocationCode;
   String? destinationLocationCode;
   DateTime? departureDate;
   DateTime? returnDate;
   String? adults;
   String? max;

  SearchParam(
    this.originLocationCode,
    this.destinationLocationCode,
    this.departureDate,
    this.returnDate,
    this.adults,
    this.max,
  );
  factory SearchParam.newParam(){
    return SearchParam("MEL", "HKT", DateTime.now(), DateTime.now(), null, null);
  }

 bool codeValidator(){
    if(destinationLocationCode == originLocationCode){
      return true;
    }
    return false;
 }
 String ? emptyValidator(String?string){
    if(string == null || string.isWhiteSpace()){
      return "empty field";
    }
    return null;
 }

  SearchParam copyWith({
    String? originLocationCode,
    String? destinationLocationCode,
    DateTime? departureDate,
    DateTime? returnDate,
    String? adults,
    String? max,
  }) {
    return SearchParam(
     originLocationCode ?? this.originLocationCode,
     destinationLocationCode ?? this.destinationLocationCode,
     departureDate ?? this.departureDate,
     returnDate ?? this.returnDate,
     adults ?? this.adults,
     max ?? this.max,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": "flight-order",
      "originLocationCode": originLocationCode,
      "destinationLocationCode": destinationLocationCode,
      "departureDate":  DateFormat('yyyy-MM-dd').format(departureDate!).toString(),
      "returnDate":  DateFormat('yyyy-MM-dd').format(returnDate!).toString(),
      "adults": adults,
      "max": max,
    };
  }
}