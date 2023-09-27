import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell({
    super.key,
    required String label,
    required void Function() onTap,
  }) : _label = label, _onTap = onTap;

  final String _label;
  final void Function() _onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Text(
        _label,
        style: const TextStyle(
          color: Color(0xFF4CA237),
          fontSize: 13,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
