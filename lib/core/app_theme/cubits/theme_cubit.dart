import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/core/app_theme/app_theme.dart';
import 'package:tee_bay_app/core/app_theme/cubits/theme_state.dart';
import 'package:tee_bay_app/core/app_theme/repository/theme_repository.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeRepository _repository;

  ThemeCubit(this._repository)
      : super(ThemeState(
          themeData: _repository.isDarkTheme
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
          isDarkTheme: _repository.isDarkTheme,
        ));

  void toggleTheme() {
    final isDarkTheme = !_repository.isDarkTheme;
    _repository.saveTheme(isDarkTheme);
    emit(ThemeState(
      themeData: isDarkTheme ? AppTheme.darkTheme : AppTheme.lightTheme,
      isDarkTheme: isDarkTheme,
    ));
  }
}
