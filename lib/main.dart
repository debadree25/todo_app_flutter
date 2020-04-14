import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final appColors = [
    Color.fromRGBO(231, 129, 109, 1.0),
    Color.fromRGBO(99, 138, 223, 1.0),
    Color.fromRGBO(111, 194, 173, 1.0)
  ];
  var currentInd = 0;
  var cardIndex = 0;
  ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors[currentInd],
      appBar: new AppBar(
        title: new Text("TODO", style: TextStyle(fontSize: 16)),
        backgroundColor: appColors[currentInd],
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          )
        ],
        elevation: 0,
      ),
      drawer: Drawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: ProfileImage(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Text(
                      'Hello, Debadree.',
                      style: TextStyle(fontSize: 48, color: Colors.white),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        'Hope you are doing well!',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text('You have 3 tasks left!',
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                  ),
                  Padding(padding: EdgeInsets.only(top: 32)),
                  Container(
                      height: 340,
                      child: ListView(
                        controller: scrollController,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          TaskCategoryCard(),
                          TaskCategoryCard(),
                          TaskCategoryCard()
                        ],
                      ))
                ],
              ))),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 12,
                  offset: Offset(4, 4))
            ]));
  }
}

class TaskCategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Container(width: 250, child: Text('Whatever')),
          ),
        ));
  }
}
