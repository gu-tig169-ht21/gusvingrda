import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final Color _color;
  final String _text;

  TextSection(this._color, this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _color,
      ),
      child: Text(_text),
    );
  }
}
