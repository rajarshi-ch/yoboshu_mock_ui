// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demography_step_num_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemographyStepNumModel _$DemographyStepNumModelFromJson(
        Map<String, dynamic> json) =>
    DemographyStepNumModel(
      id: json['id'] as String,
      previous: json['previous'] as String,
      next: json['next'] as String,
      type: json['type'] as String,
      question: json['question'] as String,
      key: json['key'] as String,
      ui: UiModel.fromJson(json['ui'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DemographyStepNumModelToJson(
        DemographyStepNumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'previous': instance.previous,
      'next': instance.next,
      'type': instance.type,
      'question': instance.question,
      'key': instance.key,
      'ui': instance.ui,
    };
