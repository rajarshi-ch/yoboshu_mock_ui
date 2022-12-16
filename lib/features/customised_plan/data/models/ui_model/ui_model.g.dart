// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UiModel _$UiModelFromJson(Map<String, dynamic> json) => UiModel(
      json['label'] as String?,
      json['iconURL'] as String?,
      json['buttonDesc'] as String?,
      json['placeholder'] as String?,
      json['inputDesciption'] as String?,
      json['imageURL'] as String?,
      (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UiModelToJson(UiModel instance) => <String, dynamic>{
      'label': instance.label,
      'iconURL': instance.iconURL,
      'buttonDesc': instance.buttonDesc,
      'placeholder': instance.placeholder,
      'inputDesciption': instance.inputDesciption,
      'imageURL': instance.imageURL,
      'imageUrls': instance.imageUrls,
    };
