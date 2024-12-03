import 'package:get_storage/get_storage.dart';

class ThemeRepository {
  static const String _themeKey = 'isDarkMode';
  final GetStorage _storage;

  ThemeRepository(this._storage);

  bool get isDarkMode => _storage.read(_themeKey) ?? false;

  void saveTheme(bool isDarkMode) {
    _storage.write(_themeKey, isDarkMode);
  }
}
