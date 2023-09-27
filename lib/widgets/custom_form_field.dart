import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    required FormFieldValidator<String> validator,
    TextInputType textInputType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    FocusNode? focusNode,
    FocusNode? nextFocus,
  }) :  _controller = controller,
        _label = label,
        _obscureText = obscureText,
        _validator = validator,
        _inputType = textInputType,
        _inputAction = textInputAction,
        _focusNode = focusNode,
        _nextFocus = nextFocus;

  final TextEditingController _controller;
  final String _label;
  final bool _obscureText;
  final FormFieldValidator<String> _validator;
  final TextInputType _inputType;
  final TextInputAction _inputAction;
  final FocusNode? _focusNode;
  final FocusNode? _nextFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: _validator,
      textAlign: TextAlign.center,
      obscureText: _obscureText,
      keyboardType: _inputType,
      textInputAction: _inputAction,
      focusNode: _focusNode,
      onFieldSubmitted: (String text) {
        if(_nextFocus != null) {
          FocusScope.of(context).requestFocus(_nextFocus);
        }
      },
      style: const TextStyle(
        color: Color(0xFF393939),
        fontSize: 13,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: _label,
        labelStyle: const TextStyle(
          color: Color(0xFF4CA237),
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF78916C),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF9CFF7B),
          ),
        ),
      ),
    );
  }
}