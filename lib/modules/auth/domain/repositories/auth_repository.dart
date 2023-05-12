// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:kw_store/core/error/failure.dart';
import 'package:kw_store/modules/auth/domain/entities/register.dart';

import '../../../../core/usecase/params/params.dart';
import '../entities/login.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> loginWithEmailAndPassword(LoginParams login);

  Future<Either<Failure, Register>> registerWithEmailAndPassword(
    RegisterParams register,
  );
  Future<Either<Failure, bool>> logout();
}
