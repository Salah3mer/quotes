import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/errors/failure.dart';
import 'package:quotes/core/usecases/use_case.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/usecases/get_quote_use_case.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final GetRandomQuoteUseCase randomQuoteUseCase;

  QuoteCubit(this.randomQuoteUseCase) : super(QuoteInitial());

 static QuoteCubit get(context)=>BlocProvider.of(context);

  Future<void> getRandomQuote() async {
    emit(GetQuoteLoadingState());
    final resulte = await randomQuoteUseCase.call(Noparmas());
    emit(
      resulte.fold(
        (failure) => GetQuoteErorrState(failuarMsg(failure)),
        (quote) => GetQuoteSuccessState(quote),
      ),
    );
  }
}

String failuarMsg(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppStrings.serverFailuar;
    case CashFailure:
      return AppStrings.cashFailuar;
    default:
      return AppStrings.unExpecitedError;
  }
}
