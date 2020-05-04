import 'package:flutter/material.dart';

class Tile extends StatefulWidget {

  final int index; 
  final comparer;

  Tile({this.comparer, this.index});
  @override
  TileState createState() => TileState();
}

class TileState extends State<Tile> {
  bool selected = false;
  String card = '';

  @override
  Widget build(BuildContext context) {
    print(widget.index);
    return GestureDetector(
      child: Container(
        alignment: Alignment(0.0,0.0),
        child: Text(selected ? widget.comparer.signs[widget.index] : card),
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          color: Colors.green,
        ),
      ),
      onTap: () => {
        setState(() {
          selected = !selected;

        })
      },
    );
  }
}