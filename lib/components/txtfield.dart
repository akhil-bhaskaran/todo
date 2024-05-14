import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_todo_app/components/styles.dart';

class TxtField extends StatelessWidget {
  final String htext;
  final TextEditingController controller;
  final int? mxline;
  const TxtField({
    super.key,
    required this.htext,
    required this.controller,
    this.mxline,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        maxLines: mxline,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(13),
            ),
            filled: true,
            fillColor: textcolor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide.none),
            hintText: htext),
      ),
    );
  }
}
