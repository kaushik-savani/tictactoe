import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: tictac(),
  ));
}

class tictac extends StatefulWidget {
  const tictac({Key? key}) : super(key: key);

  @override
  State<tictac> createState() => _tictacState();
}

class _tictacState extends State<tictac> {
  List l = List.filled(9, "");
  String p1 = "X";
  String p2 = "O";
  int cnt = 0;
  String msg = "Game is running";
  int checkwin = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tictactoe"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: () {
                  l = List.filled(9, "");
                  cnt = 0;
                  checkwin = 0;
                  msg = "Game is running";
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: 100, top: 10, bottom: 10, right: 100),
                  alignment: Alignment.center,
                  color: Colors.green,
                  child: Text(
                    "Reset",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )),
              Expanded(child: Container()),
              Expanded(
                  child: Container(
                margin:
                    EdgeInsets.only(right: 100, bottom: 10, top: 10, left: 100),
                alignment: Alignment.center,
                color: Colors.green,
                child: Text(
                  msg,
                  style: TextStyle(color: Colors.black),
                ),
              ))
            ],
          )),
          Expanded(
              flex: 3,
              child: Row(
                children: [win(0), win(1), win(2)],
              )),
          Expanded(
              flex: 3,
              child: Row(
                children: [win(3), win(4), win(5)],
              )),
          Expanded(
              flex: 3,
              child: Row(
                children: [win(6), win(7), win(8)],
              ))
        ],
      ),
    );
  }

  Widget win(int i) {
    return Expanded(
        child: InkWell(
      onTap: checkwin == 0
          ? () {
              if (l[i] == "" && checkwin == 0) {
                l[i] = p1;
                winner();
                if (checkwin == 0 && cnt < 4) {
                  while (true) {
                    int r = Random().nextInt(9);
                    if (l[r] == "") {
                      l[r] = p2;
                      winner();
                      break;
                    }
                  }
                }
                cnt++;
                setState(() {});
              }
            }
          : null,
      child: Container(
        margin: EdgeInsets.all(10),
        color: (l[i] == p1)
            ? Colors.black54
            : (l[i] == p2 ? Colors.blueGrey : Colors.grey),
        alignment: Alignment.center,
        child: Text(
          l[i],
          style: TextStyle(color: Colors.black),
        ),
      ),
    ));
  }

  winner() {
    if ((l[0] == p1 && l[1] == p1 && l[2] == p1) ||
        (l[3] == p1 && l[4] == p1 && l[5] == p1) ||
        (l[6] == p1 && l[7] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[3] == p1 && l[6] == p1) ||
        (l[1] == p1 && l[4] == p1 && l[7] == p1) ||
        (l[2] == p1 && l[5] == p1 && l[8] == p1) ||
        (l[4] == p1 && l[0] == p1 && l[8] == p1) ||
        (l[4] == p1 && l[6] == p1 && l[2] == p1)) {
      msg = "$p1 is winner";
      checkwin = 1;
    } else if ((l[0] == p2 && l[1] == p2 && l[2] == p2) ||
        (l[3] == p2 && l[4] == p2 && l[5] == p2) ||
        (l[6] == p2 && l[7] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[3] == p2 && l[6] == p2) ||
        (l[1] == p2 && l[4] == p2 && l[7] == p2) ||
        (l[2] == p2 && l[5] == p2 && l[8] == p2) ||
        (l[4] == p2 && l[0] == p2 && l[8] == p2) ||
        (l[4] == p2 && l[6] == p2 && l[2] == p2)) {
      msg = "$p2 is winner";
      checkwin = 1;
    } else if (cnt > 3) {
      msg = "Game is draw";
    }
  }
}
