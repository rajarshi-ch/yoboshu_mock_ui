import "package:flutter/material.dart";
import 'package:yoboshu_mock_ui/core/utils/date_fns.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_base.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_num.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_option.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/domain/entities/demography_step_statement.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/bloc/demography_cubit.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/widgets/multiselect_card.dart';
import 'package:yoboshu_mock_ui/features/customised_plan/presentation/widgets/video_player.dart';

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

  TextEditingController dateCtl = TextEditingController();

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
      child: Column(
        children: [
          /// The step is of type == num || string || datetime
          ///
          if (widget.step is DemographyStepNum) ...[
            Text((widget.step as DemographyStepNum).question),

            /// Using the label field to identify weather to render a text field
            if ((widget.step as DemographyStepNum).key != "height")
              (widget.step as DemographyStepNum).type == "datetime"
                  ? TextFormField(
                      controller: dateCtl,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Birthday"),
                        suffix: Icon(Icons.calendar_today),
                      ),
                      onChanged: (String value) {
                        print("On Changed");
                        widget.bloc.setFormValue(
                            (widget.step as DemographyStepNum).key, value);
                      },
                      onTap: () async {
                        DateTime? date = DateTime(1900);
                        FocusScope.of(context).requestFocus(new FocusNode());

                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            currentDate: dateCtl.text.isNotEmpty ? parseDateString(dateCtl.text) : DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));

                        if (date != null) dateCtl.text = getFormattedDate(date);
                      },
                    )
                  : TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: Text(
                            (widget.step as DemographyStepNum).ui.label ?? ""),
                      ),
                      keyboardType: getTextInputType(widget.step.type),
                      onChanged: (String value) {
                        widget.bloc.setFormValue(
                            (widget.step as DemographyStepNum).key, value);
                      },
                      initialValue: widget.bloc
                          .getFormValue((widget.step as DemographyStepNum).key),
                    ),

            /// If key == height, this is the height field
            if ((widget.step as DemographyStepNum).key == "height")
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
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
          ],

          /// The step is of type == statement
          ///
          if (widget.step is DemographyStepStatement) ...[
            (widget.step as DemographyStepStatement).ui.imageURL.contains(".mp4") ?
            VideoApp(url: (widget.step as DemographyStepStatement).ui.imageURL ) : Image.network((widget.step as DemographyStepStatement).ui.imageURL),
            Text((widget.step as DemographyStepStatement).message!),
          ],

          /// The step is of type == option/s
          ///
          if (widget.step is DemographyStepOption) ...[
            if((widget.step as DemographyStepOption).preDescription != null ) Text((widget.step as DemographyStepOption).preDescription!),
            Text((widget.step as DemographyStepOption).question!),
            if((widget.step as DemographyStepOption).postDescription != null ) Text((widget.step as DemographyStepOption).postDescription!),

            ///This is a single select option
            if(widget.step.type =="option") ...(widget.step as DemographyStepOption).options.map((String option) => OutlinedButton(onPressed: (){
              //TODO: Set selection of the option
              widget.bloc.goToNextStep();
            }, child: Text(option))).toList(),

            ///This is a multi select option
            if(widget.step.type =="options") ...(widget.step as DemographyStepOption).options.map((String option) => MultiselectCard(title: option)).toList(),

          ],

          ///Common primary button
          if(widget.step.type != "option") OutlinedButton(
              onPressed: () {
                widget.bloc.goToNextStep();
              },
              child: Text((widget.step as dynamic).ui.buttonDesc))
        ],
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

