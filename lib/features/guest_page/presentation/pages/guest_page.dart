import 'package:flutter/material.dart';
import 'package:yoboshu_mock_ui/core/presentation/widgets/primary_button.dart';
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
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: Center(
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
            PrimaryButton(
                title: "Customize My Plan",
                onPressed: () {
                  Navigator.of(context).push(CustomizedPlanPage.route());
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final a = await getDemographyStepById.call( const Params("start_demography"));
          a.fold((l) => print("Failure"), (r) => print(r));
        },
        tooltip: 'Customize My Plan',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
