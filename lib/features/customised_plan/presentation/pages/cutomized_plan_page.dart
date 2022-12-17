import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoboshu_mock_ui/core/constants/app_colors.dart';
import 'package:yoboshu_mock_ui/core/constants/app_sizes.dart';
import 'package:yoboshu_mock_ui/core/constants/app_text_styles.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/bloc/demography_cubit.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/widgets/demography_step_widget.dart';

import '../widgets/progress_bar.dart';


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
          backgroundColor: kDarkBg,
          appBar: AppBar(
            title: Text("Demography" , style: kStyleTextMain.copyWith( fontSize: kFontSizeHeading),),
            centerTitle: true,
            shadowColor: null,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: (){
                if( (state is DemographyStepLoaded && state.currentStep.id == "start_demography") || (state is! DemographyStepLoaded)){
                  Navigator.of(context).pop();
                  if(state is DemographyError) BlocProvider.of<DemographyCubit>(context).initSteps();
                } else {
                  BlocProvider.of<DemographyCubit>(context).goToPreviousStep();
                }
              },
            ),
            backgroundColor: kDarkBg,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Padding(
                padding: EdgeInsets.symmetric( horizontal: kMainPadding),
                child: ProgressBar(),
              ),
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
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}

