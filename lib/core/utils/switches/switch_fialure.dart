import 'dart:developer';

import 'package:flightes/core/utils/constatnts/failure_message.dart';

import '../../errors/failures.dart';

class SwitchFialure{
  String mapErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        log("server : ${failure.toString()}");
        return FailureMessage.SERVER_FAILURE_MESSAGE;
      case const (UnExpFailure):
        log("server : ${failure.toString()}");
        return FailureMessage.UNEXPICTED_FAILURE_MESSAGE;

      default:
        log("Un Expected : ${failure.runtimeType.toString()}");
        return FailureMessage.UNEXPICTED_FAILURE_MESSAGE;
    }
  }
}