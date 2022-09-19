import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/usecases/use_case.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/splash/domain/usecases/change_lang_usecase.dart';
import 'package:quotes/features/splash/domain/usecases/get_lang_usecase.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  final GetLangUseCase getLangUseCase;
  final ChangeLangUseCase changeLangUseCase;

  LangCubit({required this.getLangUseCase, required this.changeLangUseCase})
      : super(const ChangeLocalLangState(Locale(AppStrings.enLangCode)));
  String currentlangCode = AppStrings.enLangCode;

  Future<void> getSavedLang() async {
    final response = await getLangUseCase.call(Noparmas());
    response.fold((failure) => debugPrint(AppStrings.cashFailuar), (value) {
      currentlangCode = value;
      emit(ChangeLocalLangState(Locale(currentlangCode)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) => debugPrint(AppStrings.cashFailuar), (value) {
      currentlangCode = langCode;
      emit(ChangeLocalLangState(Locale(currentlangCode)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.enLangCode);

  void toArabic() => _changeLang(AppStrings.arLangCode);
}
