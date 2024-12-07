import 'package:flutter/material.dart';

import '../../../presentation/views/widgets/category_form.dart';
import '../../../presentation/views/widgets/description_form.dart';
import '../../../presentation/views/widgets/image_form.dart';
import '../../../presentation/views/widgets/price_form.dart';
import '../../../presentation/views/widgets/submition_form.dart';
import '../../../presentation/views/widgets/title_form.dart';

List<Widget> fromSteps = [
  const StepOneForm(),
  const StepTwoForm(),
  const StepThreeForm(),
  const StepFourForm(),
  const StepFiveForm(),
  const StepSixForm(),
];
