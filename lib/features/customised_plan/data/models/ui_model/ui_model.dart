

import 'package:json_annotation/json_annotation.dart';

part "ui_model.g.dart";

@JsonSerializable()
class UiModel {
  final String? label;
  final String? iconURL;
  final String? buttonDesc;
  final String? placeholder;
  final String? inputDesciption;
  final String? imageURL;
  final List<String>? imageUrls;
  UiModel(this.label, this.iconURL, this.buttonDesc, this.placeholder, this.inputDesciption, this.imageURL, this.imageUrls);

  factory UiModel.fromJson(Map<String, dynamic> json) =>
      _$UiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UiModelToJson(this);
}