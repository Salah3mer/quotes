part of 'quote_cubit.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object> get props => [];
}

class QuoteInitial extends QuoteState {
}

class GetQuoteLoadingState extends QuoteState {}

class GetQuoteErorrState extends QuoteState {
  final String msg;

  const GetQuoteErorrState(this.msg);

  @override
  List<Object> get props => [msg];
}
class GetQuoteSuccessState extends QuoteState {
  final Quote quote;

  const GetQuoteSuccessState(this.quote);

  @override
  List<Object> get props => [quote];
}
