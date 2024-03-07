import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/repositories/advicer_repository.dart';
import 'package:dartz/dartz.dart';

class AdvicerUsecases {
  final AdvicerRepository advicerRepository;

  AdvicerUsecases({required this.advicerRepository});

  Future<Either<Failure, AdviceEntity>> getAdviceUsecase() async {
    return advicerRepository.getAdviceFromApi();
  }
}
