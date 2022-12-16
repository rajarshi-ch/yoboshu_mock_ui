

import 'package:json_annotation/json_annotation.dart';

import '../ui_model/ui_model.dart';

part "message_model.g.dart";

@JsonSerializable()
class MessageModel {
  final String? message;
  final UiModel ui;

  MessageModel(this.message , this.ui);


  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}