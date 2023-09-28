import 'package:curso_dw_barbershop/src/core/constants/local_storage_key.dart';
import 'package:curso_dw_barbershop/src/core/exceptions/auth_exception.dart';
import 'package:curso_dw_barbershop/src/core/exceptions/sevice_exception.dart';
import 'package:curso_dw_barbershop/src/core/fp/either.dart';
import 'package:curso_dw_barbershop/src/core/fp/nil.dart';
import 'package:curso_dw_barbershop/src/repositories/user/user_repository.dart';
import 'package:curso_dw_barbershop/src/services/users_login/user_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginServiceImpl implements UserLoginService {
  final UserRepository userRepository;

  UserLoginServiceImpl({required this.userRepository});

  @override
  Future<Either<SeviceException, Nil>> execute(String email, String password) async {
    
    final loginResult = await userRepository.login(email, password);

    switch (loginResult) {
      case Success(value: final accessToken): 
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStorageKey.accessToken, accessToken);
        return Success(nil);
      case Failure(:final exception):
        return switch (exception) {
          AuthError() =>Failure(SeviceException(message: 'Erro ao realizar login')),
          AuthUnathorizedException() => Failure(SeviceException(message: 'Login ou senha invalidos')),
        };        
    }
    return Success(nil);
  }
  
}
