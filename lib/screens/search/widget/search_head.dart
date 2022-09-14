

import 'package:flutter/material.dart';
import 'package:task_app/helper/text_form.dart';

class SearchHead extends StatelessWidget{
 final TextEditingController controller;
 final dynamic onChanged;

  const SearchHead({super.key, required this.controller,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      expandedHeight: 60.0,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: TxtField(
          controller: controller,
          validator: (String? val) {},
          onChanged: onChanged,
          onSaved: (o) {},
          hintText: 'search here',
          enabled: true,
          obscureText: false,
          textInputType: TextInputType.text,
        ),
      ),
      snap: false,
      forceElevated: false,
    );
  }

}