import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class PaginationFooter extends StatelessWidget {
  final RefreshController controller;
  final bool isMoreFounded;

  const PaginationFooter({Key? key, required this.isMoreFounded, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (context, mode2) {
        Widget body;
        if (controller.footerStatus == LoadStatus.canLoading) {
          body = const Text("",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 95, 244, 54),
              ));
        } else if (controller.footerStatus == LoadStatus.noMore && isMoreFounded) {
          body = Text(context.locale.languageCode == 'en' ? "more" : "المزيد",
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 95, 244, 54),
              ));
        } else if (controller.footerStatus == LoadStatus.loading) {
          body = const CircularProgressIndicator();
        } else {
          body = const SizedBox.shrink();
        }

        return Padding(
          padding: EdgeInsets.only(top: 10),
          child: SizedBox(
            child: Center(child: body),
          ),
        );
      },
    );
  }
}
