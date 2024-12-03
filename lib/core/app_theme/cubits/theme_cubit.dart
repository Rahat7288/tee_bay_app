import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/core/app_theme/app_theme.dart';
import 'package:tee_bay_app/core/app_theme/cubits/theme_state.dart';
import 'package:tee_bay_app/core/app_theme/repository/theme_repository.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeRepository _repository;

  ThemeCubit(this._repository)
      : super(
          ThemeState(
            themeData: _repository.isDarkMode
                ? AppTheme.darkTheme
                : AppTheme.lightTheme,
            isDarkMode: _repository.isDarkMode,
          ),
        );

  void toggleTheme() {
    final isDarkMode = !state.isDarkMode;
    _repository.saveTheme(isDarkMode);
    emit(ThemeState(
      themeData: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      isDarkMode: isDarkMode,
    ));
  }
}
