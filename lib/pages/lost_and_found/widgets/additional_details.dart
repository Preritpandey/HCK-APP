import 'package:flutter/material.dart';
import 'package:hck_app/widgets/input_decoration.dart';
import 'package:hck_app/resources/constant.dart';

class AdditionalDetails extends StatelessWidget {
  final String title;
  final String hintText;
  final bool isRequired;
  final TextEditingController textController;
  const AdditionalDetails(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.textController,
      this.isRequired = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
                style: const TextStyle(fontFamily: fontFamily),
                children: [
              TextSpan(
                  text: title,
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? white
                          : const Color(0xFF4B4E52))),
              if (isRequired)
                const TextSpan(text: " *", style: TextStyle(color: Colors.red))
            ])),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        TextFormField(
            controller: textController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => isRequired && value.toString().trim().isEmpty
                ? 'Please enter the item description'
                : null,
            maxLines: 6,
            decoration: descriptionInputDecoration(context, hintText)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      ],
    );
  }
}
