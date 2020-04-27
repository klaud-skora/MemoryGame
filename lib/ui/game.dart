import 'package:flutter/material.dart';

class Game extends StatefulWidget {

  @override
  GameState createState() => GameState();
   
}

class GameState extends State<Game> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment(0.0, 0.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
          ),
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.all(3.0),
            color: Colors.green,
          ),
          itemCount: 36,
        ),
      ),
    );
  }
}