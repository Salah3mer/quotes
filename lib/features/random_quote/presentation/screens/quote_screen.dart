import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/config/local/app_localizations.dart';
import 'package:quotes/core/components/error_widget.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_quote/presentation/cubit/quote_cubit.dart';
import 'package:quotes/features/random_quote/presentation/widgets/bulid_quote.dart';
import 'package:quotes/features/splash/presentation/cubit/lang_cubit.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  Widget buildBody() {
    return BlocBuilder<QuoteCubit, QuoteState>(builder: (context, state) {
      if (state is GetQuoteLoadingState) {
        return Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        );
      } else if (state is GetQuoteSuccessState) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                BulidQuote(quote: state.quote),
                InkWell(
                  onTap: () {
                    QuoteCubit.get(context).getRandomQuote();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.primary, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.refresh_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      } else {
        return ErrorScreen(onpresed: () {
          QuoteCubit.get(context).getRandomQuote();
        });
      }
    });
  }

  AppBar buildAppbar(context) => AppBar(
        leading: IconButton(
          onPressed: () {
            if (AppLocalizations.of(context)!.isEnLocale) {
              BlocProvider.of<LangCubit>(context).toArabic();
            } else {
              BlocProvider.of<LangCubit>(context).toEnglish();
            }
          },
          icon: Icon(Icons.translate_outlined),
        ),
        title: Text(AppLocalizations.of(context)!.translate('app_name')!),
      );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: AppColors.primary,
      color: Colors.white,
      onRefresh: () async {
        QuoteCubit.get(context).getRandomQuote();
      },
      child: Scaffold(
        appBar: buildAppbar(context),
        body: buildBody(),
      ),
    );
  }
}
