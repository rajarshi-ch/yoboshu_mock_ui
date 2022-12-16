import "package:flutter/material.dart";
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_base.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_num.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/bloc/demography_cubit.dart';

class DemographyStepWidget extends StatefulWidget {
  const DemographyStepWidget({Key? key, required this.step, required this.bloc})
      : super(key: key);

  final DemographyStep step;
  final DemographyCubit bloc;

  @override
  State<DemographyStepWidget> createState() => _DemographyStepWidgetState();
}

class _DemographyStepWidgetState extends State<DemographyStepWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    /// No need to fade in at initial render of first step
    _controller.forward( from: 1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(DemographyStepWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    /// Fade in every time we move between steps
    _controller.reset();
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      key: ValueKey<String>(widget.step.id),
      child: Column(
        children: [
          if (widget.step is DemographyStepNum) ...[
            Text((widget.step as DemographyStepNum).question),

            OutlinedButton(
                onPressed: () {
                  widget.bloc.goToNextStep();

                },
                child: Text((widget.step as DemographyStepNum).ui.buttonDesc))
          ],
        ],
      ),
    );
  }
}
