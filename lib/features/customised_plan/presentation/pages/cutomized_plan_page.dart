import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/bloc/demography_cubit.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/widgets/demography_step_widget.dart';


class CustomizedPlanPage extends StatelessWidget {
  const CustomizedPlanPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const CustomizedPlanPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DemographyCubit, DemographyState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Title"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: (){
                if( (state is DemographyStepLoaded && state.currentStep.id == "start_demography") || (state is! DemographyStepLoaded)){
                  Navigator.of(context).pop();
                  if(state is DemographyError) BlocProvider.of<DemographyCubit>(context).initSteps();
                } else {
                  BlocProvider.of<DemographyCubit>(context).goToPreviousStep();
                }
              },
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  if( state is DemographyLoading) const Text(
                    "Loading",
                  ),

                  if( state is DemographyError) const Text(
                    "Error",
                  ),

                  if( state is DemographyInitial) const Text(
                    "Initial",
                  ),

                  if( state is DemographyStepLoaded ) DemographyStepWidget(step: state.currentStep, bloc: BlocProvider.of<DemographyCubit>(context)),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Customize My Plan',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}

