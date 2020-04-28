import 'package:flutter/material.dart';

import 'game.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    var background = Color(0xff222f3e);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MemoryCards Game'),
        backgroundColor: background
      ),
      body: Container(
        alignment: Alignment(0.0,0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Text(
                'How good you think your memory is ?',
                style: TextStyle(
                  color: Color(0xff01a3a4),
                  fontSize: 20.0,
                ),
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(side: BorderSide(
                color: Color(0xff222f3e),
                width: 1,
                style: BorderStyle.solid
              ), borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context)  => Game(),
                  )
                );
              },
              child: Text(
                'Let\'s play!',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff222f3e),
                ),
              ), 
            ),
          ],
        ),
      ),
    );
  }
}