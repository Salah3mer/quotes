part of 'lang_cubit.dart';

abstract class LangState extends Equatable {
  final Locale locale;
  const LangState({ required this.locale});
  @override
  List<Object> get props => [locale];
}

class ChangeLocalLangState extends LangState {
 const ChangeLocalLangState(Locale localeLang):super(locale: localeLang);
}
