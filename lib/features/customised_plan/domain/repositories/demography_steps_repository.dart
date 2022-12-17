

import 'package:dartz/dartz.dart';
import 'package:yoboshu_mock_ui/core/error/failures.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_base.dart';

abstract class DemographyStepsRepository {

  Future<Either<Failure, DemographyStep >> getDemographyStep(String id);
  Future<Either<Failure, int >> getDemographyTotalSteps();

}