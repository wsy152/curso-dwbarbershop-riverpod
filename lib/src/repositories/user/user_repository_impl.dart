import 'dart:developer';
import 'dart:io';

import 'package:curso_dw_barbershop/src/core/exceptions/auth_exception.dart';
import 'package:curso_dw_barbershop/src/core/exceptions/repository_exception.dart';
import 'package:curso_dw_barbershop/src/core/fp/either.dart';
import 'package:curso_dw_barbershop/src/core/rest_client/rest_client.dart';
import 'package:curso_dw_barbershop/src/model/user_model.dart';
import 'package:curso_dw_barbershop/src/repositories/user/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;

  UserRepositoryImpl({required this.restClient});
  @override
  Future<Either<AuthException, String>> login(
      String email, String password) async {
    try {
      final Response(:data) = await restClient.unAuth
          .post('/auth', data: {'email': email, 'password': password});
      return Success(value:  data['access_token']);
    } on DioException catch (e, s) {
      if (e.response != null) {
        final Response(:statusCode) = e.response!;
        if (statusCode == HttpStatus.forbidden) {
          return Failure(AuthUnathorizedException());
        }
      }
      log('Erro ao realizar login', error: e, stackTrace: s);
      return Failure(AuthError(message: 'Erro ao realiza login'));
    }
  }

  @override
  Future<Either<RepositoryException, UserModel>> me() async {
    try {
      final Response(:data) = await restClient.auth.get('/me');
      return Success(value:  UserModel.fromMap(data));
    } on DioException catch (e, s) {
      log('Erro ao buscar usuário logado', error: e, stackTrace: s);
      return Failure(RepositoryException(message: "Erro ao buscar usuário logado"));
    } on ArgumentError catch(e,s){
      log('Invalid json', error: e, stackTrace: s);
      return Failure(RepositoryException(message: "Erro ao buscar usuário logado"));

    }
  }
}
