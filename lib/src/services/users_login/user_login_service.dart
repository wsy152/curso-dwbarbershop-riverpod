import 'package:curso_dw_barbershop/src/core/exceptions/sevice_exception.dart';
import 'package:curso_dw_barbershop/src/core/fp/either.dart';
import 'package:curso_dw_barbershop/src/core/fp/nil.dart';

abstract interface class UserLoginService {
Future<Either<SeviceException,Nil>> execute(String email, String password);
}