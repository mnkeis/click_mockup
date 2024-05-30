// ignore_for_file: inference_failure_on_function_return_type

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/widgets/half_card.dart';
import 'package:flutter/material.dart';

class DialogCalendar extends StatefulWidget {
  const DialogCalendar({
    required this.changeDate,
    super.key,
  });

  final Function(DateTime) changeDate;

  @override
  State<DialogCalendar> createState() => _DialogCalendarState();
}

class _DialogCalendarState extends State<DialogCalendar> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CalendarDatePicker2WithActionButtons(
        config: CalendarDatePicker2WithActionButtonsConfig(
          firstDayOfWeek: 1,
          selectedDayTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          controlsTextStyle: Theme.of(context).textTheme.titleMedium,
          selectedRangeHighlightColor: Colors.white,
          centerAlignModePicker: true,
          gapBetweenCalendarAndButtons: 0,
          customModePickerIcon: const SizedBox(),
          cancelButton: HalfCard(
            height: 45,
            backgrounColor: Colors.transparent,
            border: Border.all(),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            isShadow: false,
            borderRadius: BorderRadius.circular(10),
            child: Center(
              child: Text(
                'Cerrar',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          disableModePicker: false,
          okButton: HalfCard(
            height: 45,
            isShadow: false,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            backgrounColor: ColorsConstants.green,
            borderRadius: BorderRadius.circular(10),
            child: Center(
              child: Text(
                'Aplicar',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          dayBuilder: ({
            required date,
            decoration,
            isDisabled,
            isSelected,
            isToday,
            textStyle,
          }) {
            return InkWell(
              onTap: () {
                widget.changeDate(date);
              },
              child: Center(
                child: Text(
                  '${date.day}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 14,
                      ),
                ),
              ),
            );
          },
        ),
        onCancelTapped: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        value: const [],
      ),
    );
  }
}
