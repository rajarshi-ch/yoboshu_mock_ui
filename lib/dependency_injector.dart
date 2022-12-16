import 'package:get_it/get_it.dart';
import 'package:yoboshu_mock_ui/core/usecases/usecase.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/data/datasources/demography_local_data_source.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/data/repositories/demography_steps_repository_impl.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/repositories/demography_steps_repository.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/usecases/get_demography_step_by_id_usecase.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/bloc/demography_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory<DemographyCubit>(
        () => DemographyCubit(
      getDemographyStepByIdUseCase : sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetDemographyStepById>(() => GetDemographyStepById(sl()));

  // Repository
  sl.registerLazySingleton<DemographyStepsRepository>(
        () => DemographyStepsRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<DemographyLocalDataSource>(
        () => DemographyLocalDataSourceImpl(),
  );

}