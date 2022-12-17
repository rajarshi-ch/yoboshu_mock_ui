import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yoboshu_mock_ui/core/usecases/usecase.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_base.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/usecases/get_demography_step_by_id_usecase.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/usecases/get_demography_total_steps_usecase.dart';

import '../../../../core/error/failures.dart';

part 'demography_state.dart';

class DemographyCubit extends Cubit<DemographyState> {
  DemographyCubit( {required this.getDemographyStepByIdUseCase, required this.getDemographyTotalStepsUseCase, }) : super(DemographyInitial()){
    initSteps();
  }
  int totalSteps = 0;
  /// formState declared here to maintain across page navigation
  dynamic formState = {};

  final GetDemographyStepById getDemographyStepByIdUseCase;
  final GetDemographyTotalSteps getDemographyTotalStepsUseCase;

  dynamic getFormValue(String key) {
    try {
      return formState[key];
    } catch (e) {
      return null;
    }
  }

  void setFormValue(String key, dynamic value) {
    if (formState != null) {
      formState[key] = value;
    }
  }

  void initSteps() async {
    emit(DemographyLoading());
    var result = await getDemographyStepByIdUseCase
        .call(const Params("start_demography"));

    var totalSteps = await getDemographyTotalStepsUseCase.call(NoParams());
    totalSteps.fold((failure) => emit(DemographyError()),
            (steps) => this.totalSteps = steps);
    resolveUseCaseResult(result, 1);
  }

  void goToNextStep() async {

    String next = (state as DemographyStepLoaded).currentStep.next;
    int currentStepNumber = (state as DemographyStepLoaded).stepNumber;
    emit(DemographyLoading());
    var result = await getDemographyStepByIdUseCase
        .call(Params(next));
    resolveUseCaseResult(result , currentStepNumber + 1);
  }

  void goToPreviousStep() async {

    if(state is DemographyStepLoaded){
      String next = (state as DemographyStepLoaded).currentStep.previous;
      int currentStepNumber = (state as DemographyStepLoaded).stepNumber;
      emit(DemographyLoading());
      var result = await getDemographyStepByIdUseCase
          .call(Params(next));
      resolveUseCaseResult(result, currentStepNumber -1);
    }
  }

  /// Handles error and success cases after every usecase call
  void resolveUseCaseResult(Either<Failure,DemographyStep> result , int updatedStep){
    result.fold((failure) => emit(DemographyError()),
            (successEntity) => emit(DemographyStepLoaded(successEntity, updatedStep)));
  }
}
