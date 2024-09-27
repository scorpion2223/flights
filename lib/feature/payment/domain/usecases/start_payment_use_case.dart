import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/payment_param.dart';
import 'package:flightes/feature/payment/domain/entities/payment_entity.dart';
import 'package:flightes/feature/payment/domain/repositories/payment_repository.dart';

class StartPaymentUseCase {
  final PaymentRepository repository;

  StartPaymentUseCase({required this.repository});
  Future<Either<Failure,PaymentEntity>> call(PaymentParam param)async =>await repository.startPayment(param);
}