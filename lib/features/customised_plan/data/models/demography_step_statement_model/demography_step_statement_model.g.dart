// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demography_step_statement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemographyStepStatementModel _$DemographyStepStatementModelFromJson(
        Map<String, dynamic> json) =>
    DemographyStepStatementModel(
      id: json['id'] as String,
      previous: json['previous'] as String,
      next: json['next'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      ui: UiModel.fromJson(json['ui'] as Map<String, dynamic>),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DemographyStepStatementModelToJson(
        DemographyStepStatementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'previous': instance.previous,
      'next': instance.next,
      'type': instance.type,
      'message': instance.message,
      'ui': instance.ui,
      'messages': instance.messages,
    };
