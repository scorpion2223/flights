import 'package:dartz/dartz.dart';
import 'package:flightes/feature/air_porst/domain/repositories/air_ports_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/air_porst_param.dart';
import '../entities/air_ports_entity.dart';

class GetAirPortsUseCase{
  final AirPortsRepository airPortsRepository;

  GetAirPortsUseCase({required this.airPortsRepository});

  Future<Either<Failure,AirPortsEntity>> call(AirPortsParam param) async =>await airPortsRepository.getAirPorts(param);

}