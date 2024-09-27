import 'package:bloc/bloc.dart';
import 'package:flightes/core/public/feature/country_codes/domain/entities/country_code_entity.dart';
import 'package:flightes/core/public/feature/country_codes/domain/usecases/get_country_codes_use_case.dart';
import 'package:flightes/core/utils/switches/switch_fialure.dart';
import 'package:meta/meta.dart';

part 'get_country_codes_state.dart';

class GetCountryCodesCubit extends Cubit<GetCountryCodesState> {
  final GetCountryCodesUseCase getCountryCodesUseCase;
  SwitchFialure switchFialure = SwitchFialure();
  late String code;
  GetCountryCodesCubit({required this.getCountryCodesUseCase}) : super(GetCountryCodesInitial());

  Future<void> getCodes()async{
    emit(GetCountryCodesLoading());
    final response = await getCountryCodesUseCase.call();
    response.fold(
            (failure){
          emit(GetCountryCodesFailed(message: switchFialure.mapErrorMessage(failure)));

        },

            (success){
          if(success.data!.countries!.isNotEmpty){
            code = success.data!.countries!.first.code!;

            emit(GetCountryCodesSuccess(entity: success));}
          else{
            emit(GetCountryCodesEmpty(message: "empty list"));
          }

        });
  }
}
