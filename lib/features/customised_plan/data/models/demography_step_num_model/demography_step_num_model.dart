import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/demography_step_num.dart';

part 'demography_step_num_model.g.dart';

@JsonSerializable()
class UiNumModel {
  final String? label;
  final String? iconURL;
  final String? buttonDesc;
  final String? placeholder;
  final String? inputDesciption;

  UiNumModel(this.label, this.iconURL, this.buttonDesc, this.placeholder, this.inputDesciption);

  factory UiNumModel.fromJson(Map<String, dynamic> json) =>
      _$UiNumModelFromJson(json);

  Map<String, dynamic> toJson() => _$UiNumModelToJson(this);
}

@JsonSerializable()
class DemographyStepNumModel extends DemographyStepNum {
  const DemographyStepNumModel(
      {required String id,
      required String previous,
      required String next,
      required String type,
      required String question,
      required String key,
      required UiNumModel ui})
      : super(id, previous, next, type, question, key, ui);

  factory DemographyStepNumModel.fromJson(Map<String, dynamic> json) =>
      _$DemographyStepNumModelFromJson(json);

  Map<String, dynamic> toJson() => _$DemographyStepNumModelToJson(this);
}
