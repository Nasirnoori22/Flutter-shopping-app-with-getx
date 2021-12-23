import 'package:flutter/material.dart';
import 'package:o_color_picker/o_color_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color? selectedColor = Colors.lightGreen[300];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (var states) => selectedColor!,
              )),
              child: Text(
                'Select Color',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () => showDialog<void>(
                context: context,
                builder: (_) => Material(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OColorPicker(
                        selectedColor: selectedColor,
                        colors: primaryColorsPalette,
                        onColorChange: (color) {
                          setState(() {
                            selectedColor = color;
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
