import 'package:quotes/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseCashLangDataSource {
  Future<bool> changeSavedLang({required String langCode});

  Future<String> getLangCode();
}

class CashLangDataSource implements BaseCashLangDataSource {
  final SharedPreferences sharedPreferences;

  CashLangDataSource({required this.sharedPreferences});

  @override
  Future<bool> changeSavedLang({required String langCode}) async {
    return await sharedPreferences.setString(AppStrings.localLang, langCode);
  }

  @override
  Future<String> getLangCode() async {
    return sharedPreferences.containsKey(AppStrings.localLang)
        ? sharedPreferences.getString(AppStrings.localLang)!
        : AppStrings.enLangCode;
  }
}
