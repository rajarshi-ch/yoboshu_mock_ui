// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demography_step_num_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UiNumModel _$UiNumModelFromJson(Map<String, dynamic> json) => UiNumModel(
      json['label'] as String?,
      json['iconURL'] as String?,
      json['buttonDesc'] as String?,
      json['placeholder'] as String?,
      json['inputDesciption'] as String?,
    );

Map<String, dynamic> _$UiNumModelToJson(UiNumModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'iconURL': instance.iconURL,
      'buttonDesc': instance.buttonDesc,
      'placeholder': instance.placeholder,
      'inputDesciption': instance.inputDesciption,
    };

DemographyStepNumModel _$DemographyStepNumModelFromJson(
        Map<String, dynamic> json) =>
    DemographyStepNumModel(
      id: json['id'] as String,
      previous: json['previous'] as String,
      next: json['next'] as String,
      type: json['type'] as String,
      question: json['question'] as String,
      key: json['key'] as String,
      ui: UiNumModel.fromJson(json['ui'] as Map<String, dynamic>),
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
