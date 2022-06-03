import 'package:flutter/material.dart';

import 'Utils.dart';

class _MainTicTacToe extends StatefulWidget {
  const _MainTicTacToe({Key? key}) : super(key: key);

  @override
  State<_MainTicTacToe> createState() => _MainTicTacToeState();
}
class Player{
  static const none = '';
  static const X = 'X';
  static const O = 'O';
}

class _MainTicTacToeState extends State<_MainTicTacToe> {
  static const countMarix= 3;
  static const double size = 92;

  late List<List<String>> matrix;

  @override
  void initState(){
    super.initState();

    setEmptyFields();
  }
  void setEmptyFields() =>setState(()=> matrix = List.generate(
        countMarix,
        (_) => List.generate(countMarix, (_)=>Player.none),
  ));

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: Utils.modelBuilder(matrix, (x, value) =>),
      ),
    );
  }
}
