import 'package:flutter/material.dart';
import 'package:yoboshu_mock_ui/core/constants/app_colors.dart';
import 'package:yoboshu_mock_ui/core/presentation/widgets/primary_button.dart';
import 'package:yoboshu_mock_ui/core/presentation/widgets/secondary_button.dart';
import 'package:yoboshu_mock_ui/core/usecases/usecase.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/data/repositories/demography_steps_repository_impl.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/usecases/get_demography_step_by_id_usecase.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/pages/cutomized_plan_page.dart';

import '../../../customised_plan/data/datasources/demography_local_data_source.dart';

class GuestPage extends StatelessWidget {
  GuestPage({Key? key}) : super(key: key);
  static const name = "Piyush";
  final UseCase getDemographyStepById = GetDemographyStepById(
      DemographyStepsRepositoryImpl(DemographyLocalDataSourceImpl()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBg,
      bottomNavigationBar: Container(
        height: 120.0,
        color: kDarkAccent.withOpacity(0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 4),
              child: PrimaryButtonCompact(
                  title: "Customize My Plan",
                  onTap: () {
                    Navigator.of(context).push(CustomizedPlanPage.route());
                  }),
            ),
            SecondaryButton(),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Some Text",
              ),
              Text(
                'Hi $name',
                style: Theme.of(context).textTheme.headline4,
              ),

            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
