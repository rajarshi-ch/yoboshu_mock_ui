// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demography_step_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemographyStepOptionModel _$DemographyStepOptionModelFromJson(
        Map<String, dynamic> json) =>
    DemographyStepOptionModel(
      id: json['id'] as String,
      previous: json['previous'] as String,
      next: json['next'] as String,
      type: json['type'] as String,
      preDescription: json['preDescription'] as String?,
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      postDescription: json['postDescription'] as String?,
      ui: UiModel.fromJson(json['ui'] as Map<String, dynamic>),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$DemographyStepOptionModelToJson(
        DemographyStepOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'previous': instance.previous,
      'next': instance.next,
      'type': instance.type,
      'preDescription': instance.preDescription,
      'postDescription': instance.postDescription,
      'question': instance.question,
      'options': instance.options,
      'ui': instance.ui,
      'key': instance.key,
    };
