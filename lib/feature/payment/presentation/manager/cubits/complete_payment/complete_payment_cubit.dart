import 'package:bloc/bloc.dart';
import 'package:flightes/feature/payment/domain/entities/payment_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/complete_payment_use_case.dart';

part 'complete_payment_state.dart';

class CompletePaymentCubit extends Cubit<CompletePaymentState> {
  final CompletePaymentUseCase useCase;
  final PaymentEntity param ;
  SwitchFialure switchFialure = SwitchFialure();
  CompletePaymentCubit({required this.useCase,required this.param}) : super(CompletePaymentInitial());
  Future<void> storeBooking()async{
    emit(CompletePaymentLoading());
    final response = await useCase.call(param);
    response.fold((failure){
      emit(CompletePaymentFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){
      emit(CompletePaymentSuccess(message: "success"));
    });

  }
}
