import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/demography_step_option.dart';
import '../message_model/message_model.dart';
import '../ui_model/ui_model.dart';

part 'demography_step_option_model.g.dart';


@JsonSerializable()
class DemographyStepOptionModel extends DemographyStepOption {

  const DemographyStepOptionModel(
      {required String id,
        required String previous,
        required String next,
        required String type,
        String? preDescription,
        required String question,
        required List<String> options,
        String? postDescription,
        required UiModel ui,
        String? key,})
      : super(id, previous, next, type, preDescription, question, options, postDescription, ui, key );


  factory DemographyStepOptionModel.fromJson(Map<String, dynamic> json){
    json["postDescription"] = json["post-description"];
    json["preDescription"] = json["pre-description"];
    return _$DemographyStepOptionModelFromJson(json);
  }


  Map<String, dynamic> toJson() => _$DemographyStepOptionModelToJson(this);
}
