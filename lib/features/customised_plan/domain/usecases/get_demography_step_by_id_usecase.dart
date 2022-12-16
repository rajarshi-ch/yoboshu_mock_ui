import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_base.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/repositories/demography_steps_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetDemographyStepById extends UseCase<dynamic , Params>{
  final DemographyStepsRepository repository;
  GetDemographyStepById(this.repository);

  /// The dynamic returned here would ideally be an entity
  @override
  Future<Either<Failure, DemographyStep>> call(Params params) async {
    return await repository.getDemographyStep(params.id);
  }
}

class Params extends Equatable {

  final String id;
  const Params(this.id);

  @override
  List<Object?> get props => [id];
}