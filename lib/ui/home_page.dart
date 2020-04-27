import 'package:flutter/material.dart';

import 'game.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Game'),
        backgroundColor: Color(0xff2C5364),
      ),
      body: Container(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff2C5364),            
            ),
            child: FlatButton(
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
                 color: Colors.white,
               ),
            ), 
            ),
          )
        ),
      ),
    );
  }
}