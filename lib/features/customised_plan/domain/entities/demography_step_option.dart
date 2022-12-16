

import 'demography_step_base.dart';

/// Entity for the demography step with type == ( 'option' || 'options' )
class DemographyStepOption extends DemographyStep {

  final String? preDescription;
  final String question;
  final List<String> options;

  const DemographyStepOption(super.id, super.previous, super.next, super.type, this.preDescription, this.question, this.options);



}