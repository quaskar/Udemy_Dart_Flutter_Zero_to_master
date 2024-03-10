import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({required String advice, required int id})
      : super(advice: advice, id: id);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(advice: json["advice"], id: json["id"]);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [advice, id];
}
