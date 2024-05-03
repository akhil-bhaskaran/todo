import 'package:flutter/material.dart';
import 'package:my_todo_app/components/styles.dart';

class TxtField extends StatelessWidget {
 final String htext ;
 final TextEditingController controller;
  const TxtField({
    super.key,
    required this.htext, required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:controller ,
      maxLines: 1,
      maxLength: 30,
      decoration: InputDecoration(
        
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(13),
          ),
          filled: true,
          fillColor: textcolor,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
          
          hintText: htext),
    );
  }
}
