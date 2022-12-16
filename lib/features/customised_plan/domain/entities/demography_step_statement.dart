

import 'demography_step_base.dart';

/// Entity for the demography step with type == 'statement'
class DemographyStepStatement extends DemographyStep {

  final String? message;
  final dynamic ui;
  final List<dynamic>? messages;

  const DemographyStepStatement(super.id, super.previous, super.next, super.type, this.message, this.ui, this.messages);
}