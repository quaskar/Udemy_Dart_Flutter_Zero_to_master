import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/repositories/advicer_repository.dart';
import 'package:adviser/infrastructure/repositories/advicer_repository_impl.dart';
import 'package:dartz/dartz.dart';

class AdvicerUsecases {
  final AdvicerRespository advicerRespository = AdvicerRepsoitoryImpl();

  Future<Either<Failure, AdviceEntity>> getAdviceUsecase() async {
    return advicerRespository.getAdviceFromApi();
  }
}
