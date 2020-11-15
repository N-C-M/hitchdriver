import 'package:flutter/material.dart';

class RatingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(

      child: TextFormField(
   cursorColor: Theme.of(context).cursorColor,
   initialValue: 'Input text',
   maxLength: 20,
   decoration: InputDecoration(
     icon: Icon(Icons.favorite),
     labelText: 'Label text',
     labelStyle: TextStyle(
       color: Color(0xFF6200EE),
     ),
     helperText: 'Helper text',
     suffixIcon: Icon(
       Icons.check_circle,
     ),
     enabledBorder: UnderlineInputBorder(
       borderSide: BorderSide(color: Color(0xFF6200EE)),
     ),
   ),
 ),

    ),

  );
    
}
}