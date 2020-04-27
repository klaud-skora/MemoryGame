import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {

  
  @override
  GameState createState() => GameState();
   
}


class GameState extends State<Game> {

  List<bool> cardFlips = [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true];
  List<String> signs = ['A', 'A', 'B', 'B', 'C', 'C', 'D', 'D', 'E', 'E', 'F', 'F', 'G', 'G', 'H', 'H', 'I', 'I', 'J', 'J', 'K', 'K', 'L', 'L', 'M', 'M', 'X', 'X', 'O', 'O', 'V', 'V', 'W', 'W', 'S', 'S'];  
  
  String firstCard = '';
  String secondCard = '';

  @override
  void initState() {
    super.initState();
    signs.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    // print(firstCard);

    var background = Color(0xff636363);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 200.0,
              padding: EdgeInsets.only(top: 100.0),
              child: Text('Find 18 pars !', style: TextStyle(fontSize: 20.0)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 18.0),
              alignment: Alignment(0.0, 0.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                ),
                itemBuilder: (context, index) => FlipCard(
                  onFlip: () {
                    setState(() {
                      firstCard == '' ? firstCard = signs[index] : secondCard = signs[index];
                    });
                  },
                  flipOnTouch: cardFlips[index],
                  front: Container(
                    margin: EdgeInsets.all(3.0),
                    color: background.withOpacity(.8),
                  ),
                  back: Container(
                    margin: EdgeInsets.all(3.0),
                    color: background,
                    child: Center(child: Text(signs[index])),
                  ),
                ),
                itemCount: signs.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}