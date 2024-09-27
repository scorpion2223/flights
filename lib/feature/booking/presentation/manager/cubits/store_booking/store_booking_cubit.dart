import 'package:bloc/bloc.dart';
import 'package:flightes/core/params/custom_booking_param.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/store_booking_use_case.dart';

part 'store_booking_state.dart';

class StoreBookingCubit extends Cubit<StoreBookingState> {
  final StoreBookingUseCase useCase;
  final CustomBookingParam param ;
  SwitchFialure switchFialure = SwitchFialure();
  StoreBookingCubit({required this.useCase,required this.param}) : super(StoreBookingInitial());
  Future<void> storeBooking()async{
    emit(StoreBookingLoading());
    final response = await useCase.call(param);
    response.fold((failure){
      emit(StoreBookingFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){
      emit(StoreBookingSuccess(message: ""));
    });

  }
}
