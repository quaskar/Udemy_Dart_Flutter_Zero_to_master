part of 'advicer_bloc.dart';

@immutable
sealed class AdvicerEvent {}

/// event when button pressed
class AdviceRequestedEvent extends AdvicerEvent {}
