import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/data/models/demography_step_num_model/demography_step_num_model.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/data/models/demography_step_statement_model/demography_step_statement_model.dart';

import '../models/demography_step_option_model/demography_step_option_model.dart';

abstract class DemographyLocalDataSource {
  //Future
  Future<dynamic> getDemographyStepById( String id );

  void cacheDemographySteps(dynamic data);

  Future<void> readJson();
}

class DemographyLocalDataSourceImpl implements DemographyLocalDataSource {

  dynamic jsonData ;

  @override
  void cacheDemographySteps(dynamic data) {
    jsonData = data;
  }

  @override
  Future<dynamic> getDemographyStepById(String id) async {
    if( jsonData == null){
      /// this is the first time we are trying to read data
      ///
      /// Read from json file and cache it
      var data = await readJson();
      cacheDemographySteps( data );
    }
    var step = jsonData[id];
    dynamic model;
    switch ( step["type"] ){
      case "num" :
      case "datetime" :
      case "string" :
        model = DemographyStepNumModel.fromJson(step);
        break;
      case "statement" :
        model = DemographyStepStatementModel.fromJson(step);
        break;
      case "option" :
      case "options" :
        try {
          print(step);
          model = DemographyStepOptionModel.fromJson(step);
        } catch (e) {
          print(e);
        }
        break;
    }
    return model;
  }

  @override
  Future<dynamic> readJson() async {
    var response = await rootBundle.loadString("assets/json/custom_pages.json");
    final data = await json.decode(response);
    return data;
  }
  
}