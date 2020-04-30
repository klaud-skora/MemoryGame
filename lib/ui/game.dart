import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../logic/comparer.dart';

class Game extends StatefulWidget {

  final Comparer comparer;
  Game(this.comparer, {Key key}) : super(key: key);
  
  @override
  GameState createState() => GameState();
}

class GameState extends State<Game> {

  List<GlobalKey<FlipCardState>> cardKey = [];
 
  bool flip = false;
  int pairs = 18;

  @override
  Widget build(BuildContext context) { 
    for(int i = 0; i < widget.comparer.signs.length; i++) {
      cardKey.add(GlobalKey<FlipCardState>());
    }
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
                    flipOnTouch: widget.comparer.cardFlips[index],
                    onFlip: () {
                      if(!flip) {
                        flip = true;
                        setState(() {
                          widget.comparer.setCard(Cards.first, index);
                          widget.comparer.setCard(Cards.second, index);
                          // widget.comparer.compare();
                        }); 
                      } else { 
                        setState(() {
                          flip = false;
                          widget.comparer.setCard(Cards.second, index);
                          widget.comparer.compare();
                        });                   
                      }
                      if(!widget.comparer.isEqual()) cardKey[widget.comparer.firstIndex].currentState.toggleCard();
                      widget.comparer.setCard(Cards.first, index);  
                    },
                    back: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        color: Color(0xff222f3e),
                      ),
                      margin: EdgeInsets.all(3.0),  
                    ),
                    front: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        border: Border.all(color: Color(0xff01a3a4)),
                        color: Color(0xff222f3e).withOpacity(.2),
                      ),
                      margin: EdgeInsets.all(3.0),
                      child: Center(child: Text(widget.comparer.signs[index], style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Color(0xff01a3a4) ))),
                    ),
                  ),
                  itemCount: widget.comparer.signs.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
