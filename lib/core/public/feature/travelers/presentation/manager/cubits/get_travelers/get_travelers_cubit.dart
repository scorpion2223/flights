import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flightes/core/public/feature/travelers/domain/entities/travelers_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../../../utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/get_travelers_use_case.dart';

part 'get_travelers_state.dart';

class GetTravelersCubit extends Cubit<GetTravelersState> {
  final GetTravelersUseCase useCase;
  SwitchFialure switchFialure = SwitchFialure();

  GetTravelersCubit({required this.useCase}) : super(GetTravelersInitial());

  Future<void> getTravelers()async{
    emit(GetTravelersLoading());
    final response = await useCase.call();

    response.fold(
            (failure){
          emit(GetTravelersFailed(message: switchFialure.mapErrorMessage(failure)));

        },

            (success){
              log(success.travelers.toString());
          if(success.travelers != null){

            emit(GetTravelersSuccess(entity: success));}
          else{
            emit(GetTravelersEmpty(message: "empty list"));
          }

        });
  }
}
