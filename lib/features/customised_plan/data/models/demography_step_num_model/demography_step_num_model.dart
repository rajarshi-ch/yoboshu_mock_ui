import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/demography_step_num.dart';
import '../ui_model/ui_model.dart';

part 'demography_step_num_model.g.dart';



@JsonSerializable()
class DemographyStepNumModel extends DemographyStepNum {
  const DemographyStepNumModel(
      {required String id,
      required String previous,
      required String next,
      required String type,
      required String question,
      required String key,
      required UiModel ui})
      : super(id, previous, next, type, question, key, ui);

  factory DemographyStepNumModel.fromJson(Map<String, dynamic> json) =>
      _$DemographyStepNumModelFromJson(json);

  Map<String, dynamic> toJson() => _$DemographyStepNumModelToJson(this);
}
