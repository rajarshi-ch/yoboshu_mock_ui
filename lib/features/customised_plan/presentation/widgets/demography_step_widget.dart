import "package:flutter/material.dart";
import 'package:yoboshu_mock_ui/core/constants/app_colors.dart';
import 'package:yoboshu_mock_ui/core/constants/app_sizes.dart';
import 'package:yoboshu_mock_ui/core/constants/app_strings.dart';
import 'package:yoboshu_mock_ui/core/utils/date_fns.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_base.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_num.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_option.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_statement.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/bloc/demography_cubit.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/widgets/multiselect_card.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/widgets/video_player.dart';

import '../../../../core/constants/app_text_styles.dart';

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

  TextEditingController dateCtl = TextEditingController(text: "");

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();

    /// No need to fade in at initial render of first step
    _controller.forward(from: 1);
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
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: kMainPadding, vertical: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// The step is of type == num || string || datetime
            ///
            if (widget.step is DemographyStepNum) ...[
              Text(
                (widget.step as DemographyStepNum).question,
                style: kStyleTextMain.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),

              const SizedBox(
                height: kSpacingHeight,
              ),

              /// Using the label field to identify weather to render a text field
              if ((widget.step as DemographyStepNum).key != "height")
                (widget.step as DemographyStepNum).type == "datetime"
                    ? TextFormField(
                        controller: dateCtl,
                        readOnly: true,
                  cursorColor: Colors.white,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  cursorWidth: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: kDarkAccent,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          label: Text("Birthday" , style: kStyleTextMain),
                          suffix: Icon(Icons.calendar_today),
                        ),
                        onChanged: (String value) {
                          widget.bloc.setFormValue(
                              (widget.step as DemographyStepNum).key, value);
                        },
                        onTap: () async {
                          DateTime? date = DateTime(1900);
                          FocusScope.of(context).requestFocus(new FocusNode());

                          date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              currentDate: dateCtl.text.isNotEmpty
                                  ? parseDateString(dateCtl.text)
                                  : DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));

                          if (date != null)
                            dateCtl.text = getFormattedDate(date);
                        },
                      )
                    : TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        cursorWidth: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: kDarkAccent,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          label: Text(
                            (widget.step as DemographyStepNum).ui.label ?? "",
                            style: kStyleTextMain,
                          ),
                        ),
                        keyboardType: getTextInputType(widget.step.type),
                        onChanged: (String value) {
                          widget.bloc.setFormValue(
                              (widget.step as DemographyStepNum).key, value);
                        },
                        initialValue: widget.bloc.getFormValue(
                            (widget.step as DemographyStepNum).key),
                      ),

              /// If key == height, this is the height field
              if ((widget.step as DemographyStepNum).key == "height")
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        cursorWidth: 1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: kDarkAccent,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (String value) {
                          widget.bloc.setFormValue("height_feet", value);
                        },
                        initialValue: widget.bloc.getFormValue("height_feet"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
                      child: Text("feet"),
                    ),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        cursorWidth: 1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: kDarkAccent,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (String value) {
                          widget.bloc.setFormValue("height_inches", value);
                        },
                        initialValue: widget.bloc.getFormValue("height_inches"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text("inches"),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              const SizedBox(
                height: kSpacingHeight,
              ),

              /// End button
              OutlinedButton(
                  onPressed: () {
                    widget.bloc.goToNextStep();
                  },
                  child: Text((widget.step as dynamic).ui.buttonDesc))
            ],

            /// The step is of type == statement
            ///
            if (widget.step is DemographyStepStatement) ...[
              /// This message doesn't depend on a previous choice
              if ((widget.step as DemographyStepStatement).messages ==
                  null) ...[
                (widget.step as DemographyStepStatement)
                        .ui
                        .imageURL
                        .contains(".mp4")
                    ? VideoApp(
                        url: (widget.step as DemographyStepStatement)
                            .ui
                            .imageURL)
                    : Image.network(
                        (widget.step as DemographyStepStatement).ui.imageURL),
                Text((widget.step as DemographyStepStatement).message!),

                ///End Button
                OutlinedButton(
                    onPressed: () {
                      widget.bloc.goToNextStep();
                    },
                    child: Text((widget.step as dynamic).ui.buttonDesc))
              ],

              /// This message depends on a previous choice
              if ((widget.step as DemographyStepStatement).messages !=
                  null) ...[
                (widget.step as DemographyStepStatement)
                        .messages![widget.bloc.getFormValue(kLastChosenIndex)]
                        .ui
                        .imageURL
                        .contains(".mp4")
                    ? VideoApp(
                        url: (widget.step as DemographyStepStatement)
                            .messages![
                                widget.bloc.getFormValue(kLastChosenIndex)]
                            .ui
                            .url)
                    : Image.network((widget.step as DemographyStepStatement)
                        .messages![widget.bloc.getFormValue(kLastChosenIndex)]
                        .ui
                        .imageURL),
                Text((widget.step as DemographyStepStatement)
                    .messages![widget.bloc.getFormValue(kLastChosenIndex)]
                    .message!),

                /// End button
                OutlinedButton(
                  onPressed: () {
                    widget.bloc.goToNextStep();
                  },
                  child: Text(((widget.step as DemographyStepStatement)
                      .messages![widget.bloc.getFormValue(kLastChosenIndex)]
                      .ui
                      .buttonDesc)),
                ),
              ]
            ],

            /// The step is of type == option/s
            ///
            if (widget.step is DemographyStepOption) ...[
              if ((widget.step as DemographyStepOption).preDescription != null)
                Text((widget.step as DemographyStepOption).preDescription!),
              Text((widget.step as DemographyStepOption).question!),
              if ((widget.step as DemographyStepOption).postDescription != null)
                Text((widget.step as DemographyStepOption).postDescription!),

              ///This is a single select option
              if (widget.step.type == "option")
                ...(widget.step as DemographyStepOption)
                    .options
                    .map((String option) => OutlinedButton(
                        onPressed: () {
                          //TODO: Set selection of the option
                          if ((widget.step as DemographyStepOption).key !=
                              null) {
                            widget.bloc.setFormValue(
                                (widget.step as DemographyStepOption).key!,
                                option);

                            /// Store the index of the chosen option
                            widget.bloc.setFormValue(
                                kLastChosenIndex,
                                (widget.step as DemographyStepOption)
                                    .options
                                    .indexOf(option));
                          }
                          widget.bloc.goToNextStep();
                        },
                        child: Text(option)))
                    .toList(),

              ///This is a multi select option
              if (widget.step.type == "options") ...[
                ...(widget.step as DemographyStepOption)
                    .options
                    .map((String option) => MultiselectCard(title: option))
                    .toList(),

                ///End Button
                OutlinedButton(
                    onPressed: () {
                      widget.bloc.goToNextStep();
                    },
                    child: Text((widget.step as dynamic).ui.buttonDesc))
              ],
            ],
          ],
        ),
      ),
    );
  }
}

TextInputType getTextInputType(String type) {
  if (type == "num") {
    return TextInputType.number;
  } else if (type == "datetime") {
    return TextInputType.datetime;
  } else {
    return TextInputType.text;
  }
}
