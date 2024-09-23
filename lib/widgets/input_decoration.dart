import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';

OutlineInputBorder focusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: heraldGreen),
  borderRadius: BorderRadius.circular(10),
);

OutlineInputBorder errorOutlineBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.red),
  borderRadius: BorderRadius.circular(10),
);

InputDecoration inputDecoration(
    BuildContext context, String label, bool isRequired,
    {double textScaleFactor = 1.2, double bottomPadding = 12}) {
  return InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(12, 18, 12, bottomPadding),
      isDense: true,
      label: RichText(
        textScaleFactor: textScaleFactor,
        text: TextSpan(
          style: const TextStyle(fontFamily: fontFamily),
          children: [
            TextSpan(
              text: label,
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? white
                      : const Color(0xFF4B4E52)),
            ),
            TextSpan(
              text: isRequired ? " *" : "",
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark
                ? white
                : Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: focusedBorder,
      errorBorder: errorOutlineBorder,
      focusedErrorBorder: errorOutlineBorder);
}

InputDecoration descriptionInputDecoration(
    BuildContext context, String hintText,
    {bool enableErrorBorder = true}) {
  return InputDecoration(
      filled: true,
      fillColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF1E1E1E)
          : Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark
                ? white
                : const Color(0xFFDFDFDF)),
        borderRadius: BorderRadius.circular(15),
      ),
      hintStyle: TextStyle(
          fontSize: fontSize12,
          color:
              Theme.of(context).brightness == Brightness.dark ? white : black2),
      hintText: hintText,
      focusedBorder: focusedBorder,
      errorBorder: enableErrorBorder ? errorOutlineBorder : null,
      focusedErrorBorder: enableErrorBorder ? errorOutlineBorder : null);
}
