import 'package:flutter/material.dart';

import '../utils/app_constant.dart';

class BuilFormField extends StatefulWidget {
  final Function onFieldSubmitted;
  final Function onSaved;
  final Function validator;
  final String fieldName;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final double contentPadding;
  final TextEditingController controller;
  final bool obscureText;
  final String initialValue;

  const BuilFormField({
    Key key,
    @required this.textInputAction,
    @required this.contentPadding,
    @required this.keyboardType,
    @required this.validator,
    @required this.fieldName,
    @required this.prefixIcon,
    this.initialValue,
    this.onFieldSubmitted,
    this.onSaved,
    this.focusNode,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  _BuilFormFieldState createState() => _BuilFormFieldState();
}

class _BuilFormFieldState extends State<BuilFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        labelText: widget.fieldName,
        filled: true,
        fillColor: Colors.grey[300],
        focusColor: AppColors.primaryColor,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.all(widget.contentPadding),
      ),
      initialValue: widget.initialValue,
      onSaved: widget.onSaved,
      cursorColor: AppColors.primaryColor,
      validator: widget.validator,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      controller: widget.controller,
      obscureText: widget.obscureText,
    );
  }
}
