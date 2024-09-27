import 'package:bloc/bloc.dart';
import 'package:flightes/core/params/contact_param.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/params/address_param.dart';
import '../../../../../../core/utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/add_address_use_case.dart';

part 'add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  final AddAddressUseCase useCase;
   ContactParam param = ContactParam.newParam();
  SwitchFialure switchFialure = SwitchFialure();
  AddAddressCubit({required this.useCase}) : super(AddAddressInitial());
  Future<void> addAddress()async{
    emit(AddAddressLoading());
    final response = await useCase.call(param);
    response.fold((failure){
      emit(AddAddressFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){
      emit(AddAddressSuccess(message: ""));
    });

  }
}