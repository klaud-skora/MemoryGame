// import 'package:flutter/material.dart';

import 'package:my_app/logic/comparer.dart';

class GameManager {

  Comparer comparer;
  List cardKeys;

  GameManager(this.comparer, this.cardKeys);
  int firstCard, secondCard;
  bool flip = false;

  onFlip(index) {
    print(comparer.oneRound);
    if(comparer.firstIndex == -1) {
      flip = true;
      comparer.setCard(Cards.first, index);
      comparer.setRound(index);
      comparer.noFlip(index);
    } else {
      flip = false;
      comparer.setCard(Cards.second, index);
      comparer.setRound(index);
      
      firstCard = comparer.firstIndex;
      secondCard = index;
      if(comparer.isEqual()) {
        comparer.noFlip(index); 
        comparer.resetRound();
      }
      if(!comparer.isEqual()) {
        comparer.makeFlip(comparer.firstIndex);
        Future.delayed(Duration(milliseconds: 1000), () {
          [comparer.firstIndex, comparer.secondIndex].forEach((f) => cardKeys[f].currentState.toggleCard());
          comparer.resetRound();
          comparer.setCard(Cards.first, -1);
          comparer.setCard(Cards.second, -1);
        });
      }
    }
  }
}