import 'package:bloc/bloc.dart';
import 'package:flightes/core/params/payment_param.dart';
import 'package:flightes/feature/payment/domain/entities/payment_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/start_payment_use_case.dart';

part 'start_payment_state.dart';

class StartPaymentCubit extends Cubit<StartPaymentState> {
  final StartPaymentUseCase useCase;
   PaymentParam param = PaymentParam.newParam();
  SwitchFialure switchFialure = SwitchFialure();
  StartPaymentCubit({required this.useCase}) : super(StartPaymentInitial());
  Future<void> storeBooking()async{
    emit(StartPaymentLoading());
    final response = await useCase.call(param);
    response.fold((failure){
      emit(StartPaymentFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){
      emit(StartPaymentSuccess(entity: success));
    });

  }
}
