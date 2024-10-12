import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flightes/core/params/air_porst_param.dart';
import 'package:flightes/feature/air_porst/domain/entities/air_ports_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/get_air_ports_use_case.dart';

part 'get_air_ports_state.dart';

class GetAirPortsCubit extends Cubit<GetAirPortsState> {
  final GetAirPortsUseCase getAirPortsUseCase;
  final SwitchFialure switchFailure = SwitchFialure();
  AirPortsParam param = AirPortsParam("MUC", "DE");
  GetAirPortsCubit({required this.getAirPortsUseCase})
      : super(GetAirPortsInitial());

  Future<void> getAirPorts()async{
    emit(GetAirPortsLoading());
    final response = await getAirPortsUseCase.call(param);
    response.fold(

            (failure){
          emit(GetAirPortsFailed(message: switchFailure.mapErrorMessage(failure)));
        },
            (success){
          if(success.original!.errors ==null){
            log(success.original!.errors.toString());
            if(success.original!.data!.isNotEmpty){
              log("success");
              emit(GetAirPortsSuccess(entity: success));
            }else{
              log("empty");
              emit(GetAirPortsEmpty(message: "no airports founded !"));
            }


          }else{
            log("external");
            emit(GetAirPortsFailedExternalServer(message:"external server error" ));
          }

        });

  }
}
