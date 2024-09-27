import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/payment_param.dart';
import 'package:flightes/feature/payment/domain/entities/payment_entity.dart';

abstract class PaymentRepository{
  Future<Either<Failure,PaymentEntity>> startPayment(PaymentParam param);
  Future<Either<Failure,Unit>> completePayment(PaymentEntity param);
}