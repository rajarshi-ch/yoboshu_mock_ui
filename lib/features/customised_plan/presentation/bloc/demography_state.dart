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

  const DemographyStepLoaded(this.currentStep);
  @override
  List<Object> get props => [];
}