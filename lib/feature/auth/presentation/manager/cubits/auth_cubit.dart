import 'package:bloc/bloc.dart';
import 'package:flightes/core/params/user_param.dart';
import 'package:flightes/core/utils/switches/switch_fialure.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/login_use_case.dart';
import '../../../domain/usecases/logout_use_case.dart';
import '../../../domain/usecases/register_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final RegisterUseCase registerUseCase;
  UserParam param = UserParam.newUser();
  AuthCubit({required this.registerUseCase,required this.logoutUseCase,required this.loginUseCase}) : super(AuthInitial());

  Future<void> login()async{
    emit(AuthLoading());
    final response = await loginUseCase.call(param);
    response.fold((failure){
      emit(AuthFailed(message: SwitchFialure().mapErrorMessage(failure)));
    }, (success){
      emit(AuthSuccess(message: ""));
    });
  }
  Future<void> logout()async{
    emit(AuthLoading());
    final response = await logoutUseCase.call();
    response.fold((failure){
      emit(AuthFailed(message: SwitchFialure().mapErrorMessage(failure)));
    }, (success){
      emit(AuthSuccess(message: ""));
    });
  }
  Future<void> register()async{
    emit(AuthLoading());
    final response = await registerUseCase.call(param);
    response.fold((failure){
      emit(AuthFailed(message: SwitchFialure().mapErrorMessage(failure)));
    }, (success){
      emit(AuthSuccess(message: ""));
    });
  }
}
