// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/params/params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/notification.dart';
import '../repositories/profile_repository.dart';

class GetNotificationUseCase extends Usecase<Notifications, NoParams> {
  final ProfileRepository _repository;
  GetNotificationUseCase(this._repository);

  @override
  Future<Either<Failure, Notifications>> call(NoParams params) async {
    return await _repository.getNotificationData();
  }
}
