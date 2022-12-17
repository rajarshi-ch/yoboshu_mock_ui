part of 'demography_cubit.dart';

abstract class DemographyState extends Equatable {
  const DemographyState();
}

class DemographyInitial extends DemographyState {
  @override
  List<Object> get props => [];
}

class DemographyError extends DemographyState {
  @override
  List<Object> get props => [];
}

class DemographyLoading extends DemographyState {
  @override
  List<Object> get props => [];
}

class DemographyStepLoaded extends DemographyState {

  final DemographyStep currentStep;
  final int stepNumber;
  const DemographyStepLoaded(this.currentStep, this.stepNumber);
  @override
  List<Object> get props => [];
}