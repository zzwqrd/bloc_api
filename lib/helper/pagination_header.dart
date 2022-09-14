import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PaginationHeader extends StatelessWidget {
  const PaginationHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WaterDropHeader(
        waterDropColor: const Color.fromARGB(255, 95, 244, 54),
        // completeDuration: bloc.refreshController.isLoading?const Duration(seconds: 2):const Duration(seconds: 0),
        complete: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.locale.languageCode == 'en' ? '' : '',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 95, 244, 54),
                )),
            const SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(strokeWidth: .75),
            ),
          ],
        ));
  }
}
