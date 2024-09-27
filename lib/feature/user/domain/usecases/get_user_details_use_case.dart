import 'package:dartz/dartz.dart';
import 'package:flightes/core/errors/failures.dart';
import 'package:flightes/feature/user/domain/entities/user_details_entity.dart';
import 'package:flightes/feature/user/domain/repositories/user_repository.dart';

class GetUserDetailsUseCase{
  final UserRepository userRepository;

  GetUserDetailsUseCase({required this.userRepository});

  Future<Either<Failure,UserDetailsEntity>> call(int userId) async => await userRepository.getUserDetails(userId);


}