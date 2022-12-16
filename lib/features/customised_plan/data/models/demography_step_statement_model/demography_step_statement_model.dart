import 'package:json_annotation/json_annotation.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_statement.dart';

import '../message_model/message_model.dart';
import '../ui_model/ui_model.dart';

part 'demography_step_statement_model.g.dart';


@JsonSerializable()
class DemographyStepStatementModel extends DemographyStepStatement {

  const DemographyStepStatementModel(
      {required String id,
        required String previous,
        required String next,
        required String type,
        required String message,
        required UiModel ui,
      List<MessageModel>? messages})
      : super(id, previous, next, type, message , ui , messages);


  factory DemographyStepStatementModel.fromJson(Map<String, dynamic> json) =>
      _$DemographyStepStatementModelFromJson(json);

  Map<String, dynamic> toJson() => _$DemographyStepStatementModelToJson(this);
}
