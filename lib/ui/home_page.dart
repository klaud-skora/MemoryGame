import 'package:flutter/material.dart';
import '../logic/comparer.dart';

import 'game.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    Comparer comparer = Comparer();
    var background = Color(0xff222f3e);
    var mainColor = Color(0xff01a3a4);
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
                  color: mainColor,
                  fontSize: 20.0,
                ),
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(side: BorderSide(
                color: background,
                width: 1,
                style: BorderStyle.solid
              ), borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                comparer.createSignsArray();
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context)  => Game(comparer, mainColor, background),
                  )
                );
              },
              child: Text(
                'Let\'s play!',
                style: TextStyle(
                  fontSize: 20,
                  color: background,
                ),
              ), 
            ),
          ],
        ),
      ),
    );
  }
}