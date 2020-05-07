enum Signs {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  eleven,
  twelve,
  thirteen,
  fourteen,
  fifteen,
  sixteen,
  seventeen,
  eighteen,
}

extension Letters on Signs {
  static final letters = {
    Signs.one: 'A',
    Signs.two: 'B',
    Signs.three: 'C',
    Signs.four: 'D',
    Signs.five: 'E',
    Signs.six: 'F',
    Signs.seven: 'G',
    Signs.eight: 'H',
    Signs.nine: 'I',
    Signs.ten: 'J',
    Signs.eleven: 'K',
    Signs.twelve: 'L',
    Signs.thirteen: 'M',
    Signs.fourteen: 'O',
    Signs.fifteen: 'X',
    Signs.sixteen: 'S',
    Signs.seventeen: 'V',
    Signs.eighteen: 'W',
  };

  String get letter => letters[this];
}

enum Cards {
  first,
  second,
}

class Comparer {

  int _first = -1;
  int _second = -1;
  int pairs = Signs.values.length;
  List<String> signs = [];
  List<bool> cardFlips = [];
  List<int> matched = [];
  List<int> visible = [];
  List<int> oneRound = [];
 
  setCard(Cards card, value) {
    switch(card) {
      case Cards.first:
        _first = value; 
        break;
      case Cards.second: 
        _second = value;
        break;
    }
  }

  createSignsArray() {
    Signs.values.forEach((f) {
      for(int i = 0; i < Cards.values.length; i++) {
        signs.add(f.letter);
        cardFlips.add(true);
      }
      signs.shuffle();
    });
  }

  int get firstIndex => _first;
  int get secondIndex => _second;

  String get firstSign => _first == -1 ? '-' : signs[_first];
  String get secondSign =>  _second == -1 ? '+' : signs[_second];

  bool isEqual() {
    return firstSign == secondSign;
  }
  
  noFlip(index) {
    cardFlips[index] = false;
  }

  makeFlip(index) {
    cardFlips[index] = true;
  }

  setRound(index) {
    oneRound.add(index);
  }

  resetRound() {
    oneRound = [];
  }

  // compare() {
  //   // if(secondIndex == -1) {
  //   //   cardFlips[firstIndex] = false;
  //   // }
  //   // if(firstIndex != -1 && secondIndex != -1) {
  //   //   if(firstSign == secondSign) {
  //   //     cardFlips[secondIndex] = false;
  //   //     setCard(Cards.first, -1);
  //   //     setCard(Cards.second, -1);
  //   //   } 
  //     // else {
  //     //   cardFlips[firstIndex] = true;
  //     // }
  //   }
  //   // if(isEqual()) { 
  //   //   pairs--;
  //   //   cardFlips[firstIndex] = false;
  //   //   cardFlips[secondIndex] = false;
  //   // }
  // }
}

