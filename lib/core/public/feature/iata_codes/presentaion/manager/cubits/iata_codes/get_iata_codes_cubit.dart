import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flightes/core/public/feature/iata_codes/domian/entities/iata_codes_entity.dart';
import 'package:flightes/core/public/feature/iata_codes/domian/usecases/get_iata_codes_use_case.dart';
import 'package:flightes/core/utils/switches/switch_fialure.dart';
import 'package:meta/meta.dart';

part 'get_iata_codes_state.dart';

class GetIataCodesCubit extends Cubit<GetIataCodesState> {
  final GetIataCodesUseCase getIataCodesUseCase;
  late String code;
  late String code2;
  late String name1;
  late String name2;
  SwitchFialure switchFialure = SwitchFialure();
  GetIataCodesCubit({required this.getIataCodesUseCase}) : super(GetIataCodesInitial());

  Future<void> getCodes()async{

    emit(GetIataCodesLoading());
    final response = await getIataCodesUseCase.call();
    response.fold(
            (failure){
              emit(GetIataCodesFailed(message: switchFialure.mapErrorMessage(failure)));

            },

            (success){
              log(success.toString());
              if(success.data!.isNotEmpty){
              code = success.data!.first.code!;
              code2 = success.data!.first.code!;
              name1 = success.data!.first.name!;
              name2 = success.data!.first.name!;
              emit(GetIataCodesSuccess(entity: success));}
              else{
                emit(GetIataCodesEmpty(message: "empty list"));
              }

            });
  }
}
