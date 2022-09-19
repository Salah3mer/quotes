import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';

class BulidQuote extends StatelessWidget {
  final Quote quote;
  const BulidQuote(  {Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding:const  EdgeInsets.all(20),
      child: Column(
        children: [
          Text(quote.content,style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
          const SizedBox(height: 20,),
          Text(quote.author,style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
