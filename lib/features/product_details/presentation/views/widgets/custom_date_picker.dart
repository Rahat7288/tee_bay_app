import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:tee_bay_app/core/app_theme/app_colors.dart';
import 'package:tee_bay_app/core/text_style/text_style.dart';

import '../../../../../resources/reusable_widgets/buttons/wide_button.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;
  DateTime? fromDate;
  DateTime? toDate;

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final selectedDates = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
        selectedDayTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        selectedDayHighlightColor: Colors.blue,
      ),
      dialogSize: const Size(325, 400),
      value: isFromDate && fromDate != null
          ? [fromDate!]
          : (!isFromDate && toDate != null ? [toDate!] : []),
      borderRadius: BorderRadius.circular(15),
    );

    if (selectedDates != null && selectedDates.isNotEmpty) {
      setState(() {
        if (isFromDate) {
          fromDate = selectedDates.first;
        } else {
          toDate = selectedDates.first;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display selected date

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rental Period",
                  style: TStyle.title(color: AppColor.titleTextColor),
                ),
                // From Date Field
                GestureDetector(
                  onTap: () => _selectDate(context, true),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'From Date',
                        hintText: 'Select a start date',
                        suffixIcon: const Icon(Icons.calendar_today),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      controller: TextEditingController(
                        text: fromDate == null
                            ? ''
                            : '${fromDate!.year}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // To Date Field
                GestureDetector(
                  onTap: () => _selectDate(context, false),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'To Date',
                        hintText: 'Select an end date',
                        suffixIcon: const Icon(Icons.calendar_today),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      controller: TextEditingController(
                        text: toDate == null
                            ? ''
                            : '${toDate!.year}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      wideButton(
                        width: 150.0,
                        press: () {},
                        buttonName: 'Go Back',
                        backgroundColor: AppColor.redButtonColor,
                        forgroundColor: AppColor.buttonTextColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      wideButton(
                        width: 150.0,
                        press: () {},
                        buttonName: 'Confirm',
                        backgroundColor: AppColor.primaryButtonColor,
                        forgroundColor: AppColor.buttonTextColor,
                      ),
                    ],
                  ),
                ),
                // Date picker button
              ],
            ),
          ],
        ),
      ),
    );
  }
}
