import 'package:bloc/bloc.dart';
import 'package:flightes/core/public/feature/countries/domain/entities/country_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../../../utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/get_contries_use_case.dart';

part 'get_countries_state.dart';

class GetCountriesCubit extends Cubit<GetCountriesState> {
  final GetCountriesUseCase useCase;
  String? name;

  SwitchFialure switchFialure = SwitchFialure();
  GetCountriesCubit({required this.useCase}) : super(GetCountriesInitial());
  Future<void> getCountries()async{
    emit(GetCountriesLoading());
    final response = await useCase.call();
    response.fold((failure){
      emit(GetCountriesFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){

      name =success.countries!.first.name;
      emit(GetCountriesSuccess(entity: success));
    });

  }
}