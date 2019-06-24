import 'dart:io';

import 'package:flutter/material.dart';

Widget _generateItem(int index) {
  print('generating item $index');
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: <Widget>[
        Image.network(
          'http://via.placeholder.com/200x100?text=Item$index',
          width: 200.0,
          height: 100.0,
        ),
        Expanded(
          child: Text('Item $index'),
        ),
      ],
    ),
  );
}

class DynamicListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic List'),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => _generateItem(index),
//        itemCount: 100,
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    return Future.delayed(Duration(seconds: 3), () {
      return null;
    });
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DynamicListView(),
  ));
}
