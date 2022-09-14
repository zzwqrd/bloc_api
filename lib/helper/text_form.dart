import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TxtField extends StatelessWidget {
  final dynamic validator;
  final dynamic onSaved;
  final dynamic onChanged;
  final String hintText;
  final bool enabled;
  final TextInputType textInputType;

  // final String prefix;
  final bool obscureText;
  final TextEditingController controller;

  const TxtField(
      {Key? key,
      this.validator,
      this.onSaved,
      this.onChanged,
      required this.hintText,
      required this.enabled,
      required this.textInputType,
      // required this.prefix,
      required this.obscureText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15,
        left: 15,
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        onSaved: onSaved,
        enabled: enabled,
        onChanged: onChanged,
        //   textAlign: TextAlign.center,
        keyboardType: textInputType,
        obscureText: obscureText,

        style: const TextStyle(
          // fontFamily: AppTheme.boldFont,
          color: Color(0xFFC1C1C1),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(
              width: 0.5,
              style: BorderStyle.solid,
              color:  Color(0xFFC1C1C1),
            ),
          ),
          errorStyle: const TextStyle(
            // fontFamily: AppTheme.boldFont,
            color: Color(0xFFC1C1C1),
            fontSize: 13,
          ),
          // prefixIcon: Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Image.asset(
          //     prefix,
          //     width: 15,
          //     // height: 20,
          //   ),
          // ),
          contentPadding:
              const EdgeInsets.only(left: 15, top: 20, bottom: 20, right: 15),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(
              width: 0.5,
              style: BorderStyle.solid,
              color: Color(0xFFC1C1C1),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              width: 0.5,
              style: BorderStyle.solid,
              color: Color(0xFFC1C1C1),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(
              width: 0.5,
              style: BorderStyle.solid,
              color: Color(0xFFC1C1C1),
            ),
          ),
          filled: true,
          // fillColor: AppThemeModeCubit.get(context).isDark ? Color(0xFF252424) : Colors.white,
          enabled: true,
          labelText: hintText == null ? "" : hintText.tr(),
          labelStyle: const TextStyle(
            color: Color(0xFFC1C1C1),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
