import 'package:flutter/material.dart';

import '../../views/widgets/step_five_form.dart';
import '../../views/widgets/step_four_form.dart';
import '../../views/widgets/step_one_form.dart';
import '../../views/widgets/step_six_form.dart';
import '../../views/widgets/step_three_form.dart';
import '../../views/widgets/step_two_form.dart';

List<Widget> fromSteps = [
  const StepOneForm(),
  const StepTwoForm(),
  const StepThreeForm(),
  const StepFourForm(),
  const StepFiveForm(),
  const StepSixForm(),
];
