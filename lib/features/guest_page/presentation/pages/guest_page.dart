import 'package:flutter/material.dart';
import 'package:yoboshu_mock_ui/core/constants/app_colors.dart';
import 'package:yoboshu_mock_ui/core/constants/app_sizes.dart';
import 'package:yoboshu_mock_ui/core/constants/app_strings.dart';
import 'package:yoboshu_mock_ui/core/constants/app_text_styles.dart';
import 'package:yoboshu_mock_ui/core/presentation/widgets/primary_button.dart';
import 'package:yoboshu_mock_ui/core/presentation/widgets/secondary_button.dart';
import 'package:yoboshu_mock_ui/core/usecases/usecase.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/data/repositories/demography_steps_repository_impl.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/usecases/get_demography_step_by_id_usecase.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/pages/cutomized_plan_page.dart';
import 'package:yoboshu_mock_ui/features/guest_page/presentation/widgets/checked_text_list_item.dart';
import 'package:yoboshu_mock_ui/features/guest_page/presentation/widgets/horizontal_divider.dart';

import '../../../customised_plan/data/datasources/demography_local_data_source.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/carousal_with_dots.dart';

class GuestPage extends StatelessWidget {
  GuestPage({Key? key}) : super(key: key);
  static const name = "Piyush";
  final UseCase getDemographyStepById = GetDemographyStepById(
      DemographyStepsRepositoryImpl(DemographyLocalDataSourceImpl()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBg,
      // bottomNavigationBar: Container(
      //   height: 120.0,
      //   color: kDarkAccent.withOpacity(0.2),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 4),
      //         child: PrimaryButtonCompact(
      //             title: "Customize My Plan",
      //             onTap: () {
      //               Navigator.of(context).push(CustomizedPlanPage.route());
      //             }),
      //       ),
      //       SecondaryButton(),
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      color: colorWheel[itemIndex],
                    ),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 120,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kMainPadding),
                    child: RichText(
                      text: TextSpan(
                        text: 'Weight loss is one thing. We have helped ',
                        style: kStyleHeading.copyWith(height: 1.5),
                        children: <TextSpan>[
                          TextSpan(
                              text: '5570',
                              style: kStyleTextNumeric.copyWith(
                                  fontSize: 26, color: Colors.orange)),
                          const TextSpan(text: ' real people to'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: kGuestPageBenifitsList
                        .map(
                          (title) => CheckedTextListItem(
                            title: title,
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const HorizontalDivider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kMainPadding, vertical: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "real people \nreal transformation",
                        style: kStyleTextMain.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kMainPadding),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kDefaultBorderRadius),
                              color: kYellow),
                          height: 500,
                          width: double.infinity,
                        ),
                      ),
                      Positioned.fill(
                          child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: kDarkBg, shape: BoxShape.circle),
                            child: Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: kDarkAccent, shape: BoxShape.circle),
                            child: Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  HorizontalDivider(),

                  const SizedBox(
                    height: 30,
                  ),
                  CarouselWithIndicatorDemo(),
                  HorizontalDivider(),
                  const SizedBox(
                    height: 300,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 120.0,
                color: kDarkBg.withOpacity(0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 4),
                      child: PrimaryButtonCompact(
                          title: "Customize My Plan",
                          onTap: () {
                            Navigator.of(context)
                                .push(CustomizedPlanPage.route());
                          }),
                    ),
                    SecondaryButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

final List<Color> colorWheel = [
  Colors.tealAccent,
  Colors.lightBlueAccent,
  Colors.deepPurpleAccent
];
