import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'main.dart';

class DetailsPage extends StatefulWidget {
  final TaskCategoryModel model;
  DetailsPage({this.model});
  _DetailsPageState createState() => _DetailsPageState(model: this.model);
}

class _DetailsPageState extends State<DetailsPage> {
  final TaskCategoryModel model;
  _DetailsPageState({this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Add');
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: model.color,
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
                                    child: Icon(
                                      model.ico,
                                      size: 72,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 32),
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  '5 Tasks',
                                  style: TextStyle(fontSize: 36),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 32),
                              child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    model.type,
                                    style: TextStyle(
                                        fontSize: 48, color: Colors.black),
                                  ))),
                          Padding(padding: EdgeInsets.only(bottom:32),child: LinearProgressIndicator(value: 0.8,),),
                          Container(
                              height: 350,
                              child: ListView(
                                  controller: ScrollController(),
                                  shrinkWrap: true,
                                  children: [
                                    TodoItem(),
                                    TodoItem(),
                                    TodoItem(),
                                    TodoItem(),
                                    TodoItem(),
                                    TodoItem(),
                                    TodoItem(),
                                    TodoItem(),
                                    TodoItem(),
                                    TodoItem(),
                                    TodoItem(),
                                    TodoItem(),
                                    TodoItem(),
                                  ])),
                        ],
                      )),
                    ),
                  ]),
            )));
  }
}

class TodoItem extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Material(
            color: Colors.transparent,
            child: Checkbox(value: false, onChanged: null)),
        Padding(
            padding: EdgeInsets.only(left: 8),
            child: Material(
              color: Colors.transparent,
              child: Text('Task'),
            ))
      ],
    );
  }
}
