  
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../logic/comparer.dart';

class Game extends StatefulWidget {

  const Game({Key key}) : super(key: key);
  
  @override
  GameState createState() => GameState();
   
}


class GameState extends State<Game> {

  List<GlobalKey<FlipCardState>> cardKey = [
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
  ];
  
  List<bool> cardFlips = [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true];
  static List<String> signs = ['A', 'A', 'B', 'B', 'C', 'C', 'D', 'D', 'E', 'E', 'F', 'F', 'G', 'G', 'H', 'H', 'I', 'I', 'J', 'J', 'K', 'K', 'L', 'L', 'M', 'M', 'X', 'X', 'O', 'O', 'V', 'V', 'W', 'W', 'S', 'S'];    

  int counter = 0;
  bool flip = false;
  int card = -1;
  int pairs = 18;

  String firstCard = '';
  String secondCard = '';

  @override
  void initState() {
    super.initState();
    signs.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    Comparer comparer = new Comparer();
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 200.0,
                padding: EdgeInsets.only(top: 100.0),
                child: Text(pairs == 0 ? 'Congrats, you won!' : 'Find $pairs pairs !', style: TextStyle(color: Color(0xff222f3e), fontSize: 25.0)),
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
                    key: cardKey[index],
                    flipOnTouch: cardFlips[index],
                    onFlip: () {
                      if(!flip) {
                        flip = true; 
                        card = index;
                      } else { 
                        flip = false; 
                        bool matched = comparer.isEqual(signs[card], signs[index]);
                        if (matched && card == index) {
                          setState(() { cardFlips[card] = false; });
                        } else if (matched) {
                          setState(() {
                            cardFlips[card] = false;
                            cardFlips[index] = false;
                            pairs--;
                          });
                        } else {
                          setState(() {
                            cardFlips[card] = true;
                          });
                          cardKey[card].currentState.toggleCard();
                          card = index;
                          setState(() {
                            cardFlips[card] = false;
                          });
                        }
                      }
                    },
                    front: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        color: Color(0xff222f3e),
                      ),
                      margin: EdgeInsets.all(3.0),  
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        border: Border.all(color: Color(0xff01a3a4)),
                        color: Color(0xff222f3e).withOpacity(.2),
                      ),
                      margin: EdgeInsets.all(3.0),
                      child: Center(child: Text(signs[index], style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Color(0xff01a3a4) ))),
                    ),
                  ),
                  itemCount: signs.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}