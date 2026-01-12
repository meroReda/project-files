import 'package:flutter/material.dart';

import '../theme/text_style_app.dart';

class TextFiledApp extends StatefulWidget {
  final String label;
  final Widget? prefixIcon;
  final bool? isPassword;
  final OutlineInputBorder? outlineInputBorder;
  final UnderlineInputBorder? underlineInputBorder;
  final TextStyle? textStyleLabel;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final String? Function(String?)? validator;
  final Function(String)? onChanged; 
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? errorBorder;
  final Color? fillColor;
  const TextFiledApp(
      {super.key,
      this.validator,
      this.enabledBorder,
      this.fillColor,
      required this.label,
      this.controller,
      this.onChanged,
      this.underlineInputBorder,
      this.textInputType,
      this.prefixIcon,
      this.isPassword = false,
      this.outlineInputBorder,
      this.height,
      this.width,
      this.textStyle,
      this.textStyleLabel, this.focusedBorder, this.errorBorder});

  @override
  State<TextFiledApp> createState() => _TextFiledAppState();
}

class _TextFiledAppState extends State<TextFiledApp> {
  bool openEye = true;
  void fun() {
    setState(() {
      openEye = !openEye;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      height: widget.height ?? media.height * .06,
      width: widget.width ?? media.width * .85,
      child: TextFormField(
        onChanged: widget.onChanged,
        style: widget.textStyle,
        controller: widget.controller,
        obscureText: widget.isPassword! && openEye == true,
        validator: widget.validator,
        decoration: InputDecoration(
          
            suffixIcon: widget.isPassword == false
                ? null
                : IconButton(
                    onPressed: fun,
                    icon: Icon(
                      openEye == false
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                      size: 16,
                    )),
                    errorStyle: TextStyleApp.font8Grey.copyWith(color: Colors.red),
                
            fillColor: widget.fillColor,
            filled: widget.fillColor == null ? false : true,
            prefixIcon: widget.prefixIcon,
            errorBorder: widget.enabledBorder,
            enabledBorder:  widget.enabledBorder??  widget.outlineInputBorder ??
                (widget.underlineInputBorder != null
                    ? widget.outlineInputBorder
                    : const UnderlineInputBorder()),
            focusedBorder: widget.focusedBorder?? widget.outlineInputBorder ??
                (widget.underlineInputBorder != null
                    ? widget.outlineInputBorder
                    : const UnderlineInputBorder()),
            hintText: widget.label,
            hintStyle: widget.textStyleLabel ?? TextStyleApp.font9Grey),
        keyboardType: widget.textInputType ?? TextInputType.text,
      ),
    );
  }
}
