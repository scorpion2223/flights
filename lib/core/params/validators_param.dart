import 'package:flightes/core/utils/constatnts/validation_message.dart';
import 'package:flightes/core/utils/extensions/string_extension.dart';

abstract class ValidatorsParam{

  String ?emptyValidator(String?string){
    if(string == null||string.isWhiteSpace()){
      return ValidationMessage.emptyField;
    }
    return null;
  }

}