import 'package:get_storage/get_storage.dart';

class ThemeRepository {
  static const String _themeKey = 'isDarkTheme';
  final GetStorage _storage;

  ThemeRepository(this._storage);

  bool get isDarkTheme => _storage.read(_themeKey) ?? false;

  void saveTheme(bool isDarkTheme) {
    _storage.write(_themeKey, isDarkTheme);
  }
}
