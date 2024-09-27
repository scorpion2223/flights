import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/core/params/address_param.dart';
import 'package:flightes/core/params/contact_param.dart';
import 'package:flightes/feature/user/domain/repositories/user_repository.dart';

class AddAddressUseCase{
  final UserRepository userRepository;

  AddAddressUseCase({required this.userRepository});

  Future<Either<Failure,Unit>> call(ContactParam param ) async =>await userRepository.addAddress(param);
}