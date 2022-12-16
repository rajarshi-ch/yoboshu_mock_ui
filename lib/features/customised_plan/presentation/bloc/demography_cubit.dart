import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_base.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/usecases/get_demography_step_by_id_usecase.dart';

import '../../../../core/error/failures.dart';

part 'demography_state.dart';

class DemographyCubit extends Cubit<DemographyState> {
  DemographyCubit({required this.getDemographyStepByIdUseCase, this.formState}) : super(DemographyInitial()){
    initSteps();
  }

  /// formState declared here to maintain across page navigation
  dynamic formState = {};

  final GetDemographyStepById getDemographyStepByIdUseCase;

  dynamic getFormValue(String key) {
    try {
      return formState[key];
    } catch (e) {
      return null;
    }
  }

  void setFormValue(String key, dynamic value) {
    if (formState) {
      formState[key] = value;
    }
  }

  void initSteps() async {
    emit(DemographyLoading());
    var result = await getDemographyStepByIdUseCase
        .call(const Params("start_demography"));
    resolveUseCaseResult(result);
  }

  void goToNextStep() async {

    String next = (state as DemographyStepLoaded).currentStep.next;
    emit(DemographyLoading());
    var result = await getDemographyStepByIdUseCase
        .call(Params(next));
    resolveUseCaseResult(result);
  }

  void goToPreviousStep() async {

    String next = (state as DemographyStepLoaded).currentStep.previous;
    emit(DemographyLoading());
    var result = await getDemographyStepByIdUseCase
        .call(Params(next));
    resolveUseCaseResult(result);
  }

  /// Handles error and success cases after every usecase call
  void resolveUseCaseResult(Either<Failure,DemographyStep> result){
    result.fold((failure) => emit(DemographyError()),
            (successEntity) => emit(DemographyStepLoaded(successEntity)));
  }
}
