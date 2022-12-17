import 'package:dartz/dartz.dart';
import 'package:yoboshu_mock_ui/core/error/failures.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/data/datasources/demography_local_data_source.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_base.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/repositories/demography_steps_repository.dart';

class DemographyStepsRepositoryImpl implements DemographyStepsRepository {
  final DemographyLocalDataSource localDataSource;

  DemographyStepsRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, DemographyStep>> getDemographyStep(String id) async {
    try {
      final demographyStep = await localDataSource.getDemographyStepById(id);
      return Right(demographyStep);
    } catch (e) {
      print(e);
      return left(LocalStorageException());
    }
  }

  @override
  Future<Either<Failure, int>> getDemographyTotalSteps() async {
    try {
      final noOfSteps = await localDataSource.getDemographyTotalSteps();
      return Right(noOfSteps);
    } catch (e) {
      print(e);
      return left(LocalStorageException());
    }
  }



}