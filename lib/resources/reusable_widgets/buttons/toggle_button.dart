import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/core/app_theme/cubits/theme_cubit.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (kDebugMode) {
          print('presss');
        }
        context.read<ThemeCubit>().toggleTheme;
      },
      child: Text(
        context.watch<ThemeCubit>().state.isDarkMode
            ? 'Switch to Light Theme'
            : "Switch to Dark Theme",
      ),
    );
  }
}
