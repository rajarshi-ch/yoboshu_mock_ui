import 'demography_step_base.dart';

/// Entity for the demography step with type == 'num'
class DemographyStepNum extends DemographyStep {

  const DemographyStepNum(super.id, super.previous, super.next, super.type, this.question, this.key, this.ui);

  final String question;
  final String key;
  final dynamic ui;
}