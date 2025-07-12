import 'package:flutter/material.dart';


class CustomDropdownButton extends StatelessWidget{
  List <String> items;
  double width;

  CustomDropdownButton({required this.items, required this.width});    // Constructor for the class

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric( horizontal: width * 0.05 ),              // padding for the drop down
      width: width,
      decoration: BoxDecoration(                           // decorations for the drop down
          color:  const Color.fromARGB(124, 88, 88, 88), 
          borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
          items: items.map((e) {                           
            return DropdownMenuItem(child: Text(e), value: e);
          }).toList(),

          onChanged: (_) {}, // passing _ in means nothing is changed
          underline: Container(),    // Removes the underline from the drop down
          value: items.first,        // The first value of the list is displayed

          dropdownColor: const Color.fromARGB(124, 88, 88, 88), 
          style: TextStyle(
              color: Colors.white54,
          ),
          
            
      ),
    ); 
  }

}