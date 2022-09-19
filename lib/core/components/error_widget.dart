import 'package:flutter/material.dart';
import 'package:quotes/config/local/app_localizations.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/media_query_values.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback? onpresed;

  const ErrorScreen({Key? key, required this.onpresed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(

            child: Icon(
          Icons.error_outline_rounded,
          size: 150,
          color: AppColors.primary,
        )),
        Text(
          AppLocalizations.of(context)!.translate('something_went_wrong')!,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.black),
        ),
        Text(
          AppLocalizations.of(context)!.translate('try_again')!,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.grey),
        ),

        Container(
          height: 50,
          width: context.width *.55,
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: ElevatedButton(
              onPressed: () {
                if (onpresed != null) {
                  onpresed!();
                }
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              child: Text(
               AppLocalizations.of(context)!.translate('reload_screen')!,
                style: Theme.of(context).textTheme.bodyText1,
              )),
        )
      ],
    );
  }
}
