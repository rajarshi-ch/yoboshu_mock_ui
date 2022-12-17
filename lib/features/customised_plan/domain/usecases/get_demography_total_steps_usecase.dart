import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_base.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/repositories/demography_steps_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetDemographyTotalSteps extends UseCase<dynamic , NoParams>{
  final DemographyStepsRepository repository;
  GetDemographyTotalSteps(this.repository);

  /// The dynamic returned here would ideally be an entity
  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return await repository.getDemographyTotalSteps();
  }
}

