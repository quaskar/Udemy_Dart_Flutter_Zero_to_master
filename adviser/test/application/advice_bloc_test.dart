import 'package:adviser/application/advicer/advicer_bloc.dart';
import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/usecases/advicer_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'advice_bloc_test.mocks.dart';

@GenerateMocks([AdvicerUsecases])
void main() {
  late AdvicerBloc advicerBloc;
  late MockAdvicerUsecases mockAdvicerUsecases;

  setUp(() {
    mockAdvicerUsecases = MockAdvicerUsecases();
    advicerBloc = AdvicerBloc(usecases: mockAdvicerUsecases);
  });

  test("Init state should AdviceInitial", () {
    //assert
    expect(advicerBloc.state, equals(AdvicerInitial()));
  });

  group("AdviceRequestedEvent", () {
    final tAdvice = AdviceEntity(advice: "test", id: 1);
    const tAdviceString = "test";

    test("should call usecase if event is added", () async {
      // arrange
      when(mockAdvicerUsecases.getAdviceUsecase())
          .thenAnswer((_) async => Right(tAdvice));

      // act
      advicerBloc.add(AdviceRequestedEvent());
      await untilCalled(mockAdvicerUsecases.getAdviceUsecase());

      //assert
      verify(mockAdvicerUsecases.getAdviceUsecase());
      verifyNoMoreInteractions(mockAdvicerUsecases);
    });

    test("should emit loading them loaded state after event is added",
        () async {
      // arrange
      when(mockAdvicerUsecases.getAdviceUsecase())
          .thenAnswer((_) async => Right(tAdvice));

      // assert kater
      final expected = [
        AdvicerStateLoading(),
        AdvicerStateLoaded(advice: tAdviceString)
      ];
      expectLater(advicerBloc.stream, emitsInAnyOrder(expected));

      // act
      advicerBloc.add(AdviceRequestedEvent());
    });

    test(
        "should emit loading then the error state after event is added -> usecases fails -> server failure",
        () async {
      // arrange
      when(mockAdvicerUsecases.getAdviceUsecase())
          .thenAnswer((_) async => Left(ServerFailure()));

      // assert kater
      final expected = [
        AdvicerStateLoading(),
        AdvicerStateError(message: SERVER_FAILURE_MESSAGE)
      ];
      expectLater(advicerBloc.stream, emitsInAnyOrder(expected));

      // act
      advicerBloc.add(AdviceRequestedEvent());
    });

    test(
        "should emit loading then the error state after event is added -> usecases fails -> general failure",
        () async {
      // arrange
      when(mockAdvicerUsecases.getAdviceUsecase())
          .thenAnswer((_) async => Left(GeneralFailure()));

      // assert kater
      final expected = [
        AdvicerStateLoading(),
        AdvicerStateError(message: GENERAL_FAILURE_MESSAGE)
      ];
      expectLater(advicerBloc.stream, emitsInAnyOrder(expected));

      // act
      advicerBloc.add(AdviceRequestedEvent());
    });
  });
}
