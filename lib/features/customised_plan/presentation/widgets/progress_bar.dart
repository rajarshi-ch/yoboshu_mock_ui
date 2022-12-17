import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoboshu_mock_ui/core/constants/app_colors.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/bloc/demography_cubit.dart';

void main() => runApp(const ProgressBar());

double height = 20;
double accentHeight = 8;
double accentOffset = 4;

const Color _color = Colors.green;
final BorderRadiusGeometry _borderRadius = BorderRadius.circular(height / 2);
final BorderRadiusGeometry _accentBorderRadius = BorderRadius.circular(
    accentHeight / 2);

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  double _width = height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          final random = Random();
          _width = random.nextInt(300).toDouble();
        });
      },
      child: BlocListener<DemographyCubit, DemographyState>(
        listener: (context, state) {
          if( state is DemographyStepLoaded){


              if(state.stepNumber > 1 ){
                double percentage = state.stepNumber / BlocProvider.of<DemographyCubit>(context).totalSteps ;
                setState(() {
                  _width = MediaQuery.of(context).size.width * percentage ;
                });
              }


          }
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: height,
              decoration: BoxDecoration(
                color: kDarkAccent,
                borderRadius: _borderRadius,
              ),
            ),
            AnimatedContainer(
              // Use the properties stored in the State class.
              width: _width,
              height: height,
              decoration: BoxDecoration(
                color: kColorAccentDark,
                borderRadius: _borderRadius,
              ),
              // Define how long the animation should take.
              duration: const Duration(seconds: 1),
              // Provide an optional curve to make the animation feel smoother.
              curve: Curves.fastOutSlowIn,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 3, 6, 9),
                child: Container(
                  width: (_width - accentOffset) < accentHeight
                      ? accentHeight
                      : _width - accentOffset,
                  height: accentHeight,
                  decoration: BoxDecoration(
                    color: kColorAccentLight,
                    borderRadius: _accentBorderRadius,
                  ),
                ),
              ),
            ),
            // AnimatedPositioned(top: height/8, left : accentOffset/2 , duration: const Duration(seconds: 1),
            // child: Container(
            //   width: (_width - accentOffset) < accentHeight ? accentHeight : _width - accentOffset,
            //   height: accentHeight,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: _accentBorderRadius,
            //   ),
            // ),)

          ],
        ),
      ),
    );
  }
}

