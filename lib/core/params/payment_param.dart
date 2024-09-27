import 'package:flightes/core/params/validators_param.dart';

class PaymentParam extends ValidatorsParam{
  String?amount;
  String?currency;


  PaymentParam(
      this.amount,
      this.currency,
      );

  factory PaymentParam.newParam(){
    return PaymentParam(null, "usd");
  }

  Map<String,dynamic> toJson(){
    return {
      "amount":amount,
      "currency":currency
    };
  }

  PaymentParam copyWith({
    String?amount,
    String?currency,
}){
    return PaymentParam(amount??this.amount, currency??this.currency);
}
}