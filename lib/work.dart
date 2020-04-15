import 'package:flutter/material.dart';
import 'main.dart';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  final TaskCategoryModel model = TaskCategoryModel(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Hero(
            tag: model.type,
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(),
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                    radius: 48,
                                    backgroundColor: model.color,
                                    child: Icon(Icons.work, size: 72,color: Colors.white,))
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 32),
                              child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    model.type,
                                    style: TextStyle(
                                        fontSize: 48, color: Colors.black),
                                  )))
                        ],
                      )),
                    ),
                  ]),
            )));
  }
}
