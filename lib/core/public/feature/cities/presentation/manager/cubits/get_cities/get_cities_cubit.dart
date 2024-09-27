import 'package:bloc/bloc.dart';
import 'package:flightes/core/public/feature/cities/domain/entities/cities_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../../../utils/switches/switch_fialure.dart';
import '../../../../domain/usecases/get_cities_use_case.dart';

part 'get_cities_state.dart';

class GetCitiesCubit extends Cubit<GetCitiesState> {
  final GetCitiesUseCase useCase;
  String? name;

  SwitchFialure switchFialure = SwitchFialure();
  GetCitiesCubit({required this.useCase}) : super(GetCitiesInitial());
  Future<void> getCities()async{
    emit(GetCitiesLoading());
    final response = await useCase.call();
    response.fold((failure){
      emit(GetCitiesFailed(message: switchFialure.mapErrorMessage(failure)));
    }, (success){

      name =success.cities!.first.name;
      emit(GetCitiesSuccess(entity: success));
    });

  }
}