import 'package:flutter/material.dart';
import 'personal.dart';
import 'home.dart';
import 'work.dart';

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final appColors = [
    Color.fromRGBO(231, 129, 109, 1.0),
    Color.fromRGBO(99, 138, 223, 1.0),
    Color.fromRGBO(111, 194, 173, 1.0)
  ];
  Color currentCol = Color.fromRGBO(231, 129, 109, 1.0);
  var cardIndex = 0;
  ScrollController scrollController;
  AnimationController animationController;
  CurvedAnimation curve;
  ColorTween colorTween;
  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  Widget _taskList(position) {
    return GestureDetector(
        child: TaskCategoryCard(
          model: TaskCategoryModel(position),
        ),
        onHorizontalDragEnd: (details) {
          animationController = new AnimationController(
              vsync: this, duration: Duration(milliseconds: 250));
          curve = CurvedAnimation(
              parent: animationController, curve: Curves.fastOutSlowIn);
          animationController.addListener(() {
            setState(() {
              currentCol = colorTween.evaluate(curve);
            });
          });
          if (details.velocity.pixelsPerSecond.dx > 0) {
            if (cardIndex > 0) {
              cardIndex--;
            }
            colorTween =
                ColorTween(begin: currentCol, end: appColors[cardIndex]);
          } else {
            if (cardIndex < 2) {
              cardIndex++;
              colorTween =
                  ColorTween(begin: currentCol, end: appColors[cardIndex]);
            }
          }
          setState(() {
            scrollController.animateTo(cardIndex * 266.0,
                duration: Duration(milliseconds: 250),
                curve: Curves.fastOutSlowIn);
            colorTween.animate(curve);
            animationController.forward();
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentCol,
      appBar: new AppBar(
        title: new Text("TODO", style: TextStyle(fontSize: 16)),
        centerTitle: true,
        backgroundColor: currentCol,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          )
        ],
        elevation: 0,
      ),
      drawer: Drawer(),
      body: Container(
        child: Column(
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
                    Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Text("Today : 15th April, 2019",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.8))),
                    ),
                  ],
                ))),
            Column(children: [
              Container(
                  height: 350,
                  child: ListView(
                    controller: scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      _taskList(0),
                      _taskList(1),
                      _taskList(2)
                    ],
                  ))
            ])
          ],
        ),
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
          ]),
      child: Icon(Icons.account_circle),
    );
  }
}

class TaskCategoryModel {
  String type;
  StatefulWidget route;
  Icon icon;
  Color color;
  TaskCategoryModel(int num) {
    if (num == 0) {
      type = 'Personal';
      route = PersonalPage();
      color = Color.fromRGBO(231, 129, 109, 1.0);
      icon = Icon(Icons.account_circle,color: this.color,);
    } else if (num == 1) {
      type = 'Work';
      route = WorkPage();
      color = Color.fromRGBO(99, 138, 223, 1.0);
      icon = Icon(Icons.work,color: this.color,);
    } else {
      type = 'Home';
      route = HomePage();
      color = Color.fromRGBO(111, 194, 173, 1.0);
      icon = Icon(Icons.home,color: this.color,);
    }
    //print(type);
  }
}

class TaskCategoryCard extends StatelessWidget {
  final TaskCategoryModel model;
  TaskCategoryCard({this.model});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Hero(
              tag: model.type,
              child: Container(
                  width: 250,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              model.icon,
                              Icon(
                                Icons.more_vert,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(64)),
                        Material(
                          color: Colors.transparent,
                            child: Text('5 Tasks ',
                                style: TextStyle(fontSize: 18))),
                        Material(
                          color: Colors.transparent,
                            child: Text(
                          model.type,
                          style: TextStyle(fontSize: 24),
                        )),
                        Padding(
                            padding: EdgeInsets.all(8),
                            child: LinearProgressIndicator(
                              value: 0.8,
                            ))
                      ])),
            ),
          ),
        ),
      ),
      onVerticalDragUpdate: (details) {
        Navigator.of(context)
            .push(RouteTransition(builder: (context) => model.route));
      },
    );
  }
}

class RouteTransition extends MaterialPageRoute {
  RouteTransition({
    WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            settings: settings,
            fullscreenDialog: fullscreenDialog);
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}
