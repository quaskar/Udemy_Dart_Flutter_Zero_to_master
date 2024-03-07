part of 'advicer_bloc.dart';

@immutable
abstract class AdvicerEvent {}

/// event when button pressed
class AdviceRequestedEvent extends AdvicerEvent {}
