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

  int _first;
  int _second;
  List<String> signs = [];
  List<bool> cardFlips = [];

  int get firstIndex => _first;
  int get secondIndex => _second;


  String get firstSign => _first == null ? '-' : signs[_first];
  String get secondSign =>  _second == null ? '+' : signs[_second];

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

  String getSign(int index) {
    return signs[index];
  }

  bool isEqual() {
    return firstSign == secondSign;
  }

  compare() {
    if(isEqual()) { 
      cardFlips[firstIndex] = false;
      cardFlips[secondIndex] = false;
    } 
  }
}

