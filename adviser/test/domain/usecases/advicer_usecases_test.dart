import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/repositories/advicer_repository.dart';
import 'package:adviser/domain/usecases/advicer_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'advicer_usecases_test.mocks.dart';

@GenerateMocks([AdvicerRepository])
void main() {
  late AdvicerUsecases advicerUsecases;
  late MockAdvicerRepository mockAdvicerRepository;

  setUp(() {
    mockAdvicerRepository = MockAdvicerRepository();
    advicerUsecases = AdvicerUsecases(advicerRepository: mockAdvicerRepository);
  });

  group('getAdviceUsecase', () {
    final tAdvice = AdviceEntity(advice: "Test", id: 1);

    test('should return the same advice as repo', () async {
      // arrange
      when(mockAdvicerRepository.getAdviceFromApi())
          .thenAnswer((_) async => Right(tAdvice));

      // act
      final result = await advicerUsecases.getAdviceUsecase();

      // assert
      expect(result, Right(tAdvice));
      verify(mockAdvicerRepository.getAdviceFromApi());
      verifyNoMoreInteractions(mockAdvicerRepository);
    });

    test('should return the same server failure as repo', () async {
      // arrange
      when(mockAdvicerRepository.getAdviceFromApi())
          .thenAnswer((_) async => Left(ServerFailure()));

      // act
      final result = await advicerUsecases.getAdviceUsecase();

      // assert
      expect(result, Left(ServerFailure()));
      verify(mockAdvicerRepository.getAdviceFromApi());
      verifyNoMoreInteractions(mockAdvicerRepository);
    });

    test('should return the same general failure as repo', () async {
      // arrange
      when(mockAdvicerRepository.getAdviceFromApi())
          .thenAnswer((_) async => Left(GeneralFailure()));

      // act
      final result = await advicerUsecases.getAdviceUsecase();

      // assert
      expect(result, Left(GeneralFailure()));
      verify(mockAdvicerRepository.getAdviceFromApi());
      verifyNoMoreInteractions(mockAdvicerRepository);
    });
  });
}
