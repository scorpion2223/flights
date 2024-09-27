import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/feature/payment/domain/entities/payment_entity.dart';
import 'package:flightes/feature/payment/domain/repositories/payment_repository.dart';

class CompletePaymentUseCase {
  final PaymentRepository repository;

  CompletePaymentUseCase({required this.repository});
  Future<Either<Failure,Unit>> call(PaymentEntity param)async =>await repository.completePayment(param);
}