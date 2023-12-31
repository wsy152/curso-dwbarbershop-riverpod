import 'package:asyncstate/asyncstate.dart';
import 'package:curso_dw_barbershop/src/core/exceptions/sevice_exception.dart';
import 'package:curso_dw_barbershop/src/core/fp/either.dart';
import 'package:curso_dw_barbershop/src/core/providers/application_providers.dart';
import 'package:curso_dw_barbershop/src/features/auth/login/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVm extends _$LoginVm {
  @override
  LoginState build() => LoginState.initial();

  Future<void> login(String email, String password) async {

    final loaderHandle = AsyncLoaderHandler()..start();

    final loginService = ref.watch(userLoginServiceProvider);

    final result = await loginService.execute(email, password);

    switch (result) {
      case Success():
        break;
      case Failure(exception : SeviceException(:final  message)):
        state = state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: () => message,
        );
    }
    loaderHandle.close();
  }
  
}
