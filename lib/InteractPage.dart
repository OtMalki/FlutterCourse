import 'package:flutter/material.dart';

class InteractPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InteractPageState();
}

class InteractPageState extends State<InteractPage>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Color backgroundColor = Colors.white;
  Color TextColor = Colors.black;

  @override
  Widget build(BuildContext context){ 
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful widget test"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
            color: backgroundColor,
            child: Center(
                child: Text(
                "Stateful widget",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: TextColor
                ),
            ),),),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            backgroundColor = (backgroundColor == Colors.white) ? Colors.black : Colors.white;
            TextColor = (TextColor == Colors.black) ? Colors.white : Colors.black;
          }),
          print("Tapped")
        },
        child: Icon(Icons.color_lens),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}