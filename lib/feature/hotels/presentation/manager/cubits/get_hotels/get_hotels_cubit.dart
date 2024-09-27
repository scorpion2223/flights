import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flightes/core/params/hotels_param.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/entities/hotels_entity.dart';
import '../../../../domain/usecases/get_hotels_use_case.dart';

part 'get_hotels_state.dart';

class GetHotelsCubit extends Cubit<GetHotelsState> {
  final GetHotelsUseCase getHotelsUseCase;
  final SwitchFialure switchFailure = SwitchFialure();
  HotelsParam  param = HotelsParam("PAR");
  GetHotelsCubit({required this.getHotelsUseCase}) : super(GetHotelsInitial());
  Future<void> getHotels()async{
    emit(GetHotelsLoading());
    final response = await getHotelsUseCase.call(param);
    response.fold(

            (failure){
          emit(GetHotelsFailed(message: switchFailure.mapErrorMessage(failure)));
        },
            (success){
          if(success.original!.errors ==null){
            log(success.original!.errors.toString());
            if(success.original!.data!.isNotEmpty){
              log("success");
              emit(GetHotelsSuccess(entity: success));
            }else{
              log("empty");
              emit(GetHotelsEmpty(message: "no hotels founded !"));
            }


          }else{
            log("external");
            emit(GetHotelsFailedExternalServer(message:"external server error" ));
          }

        });

  }
}
