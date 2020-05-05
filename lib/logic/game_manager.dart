// import 'package:flutter/material.dart';

import 'package:my_app/logic/comparer.dart';

class GameManager {

  bool flip;
  Comparer comparer;
  List cardKeys;

  GameManager(this.flip, this.comparer, this.cardKeys);

  onFlip(index) {
    if(!flip) {
      flip = true;
        comparer.setCard(Cards.first, index);
        comparer.setCard(Cards.second, index);
    } else { 
      comparer.cardFlips[comparer.firstIndex] = true;
      flip = false;
      comparer.setCard(Cards.second, index);
      comparer.compare();
      if(!comparer.isEqual()) {
        cardKeys[comparer.firstIndex].currentState.toggleCard();
      }
      comparer.changeFlip(true);
      comparer.setCard(Cards.first, index);
    }
  }
}