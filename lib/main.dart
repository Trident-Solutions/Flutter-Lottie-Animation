import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FluttieAnimationController animationCtrl1;
  FluttieAnimationController animationCtrl2;
  FluttieAnimationController animationCtrl3;
  FluttieAnimationController animationCtrl4;

  @override
  initState() {
    super.initState();
    prepareAnimation1();
    prepareAnimation2();
    prepareAnimation3();
    prepareAnimation4();
  }

  @override
  dispose() {
    super.dispose();
    animationCtrl1?.dispose();
    animationCtrl2?.dispose();
    animationCtrl3?.dispose();
    animationCtrl4?.dispose();
  }

  prepareAnimation1() async {
    var instance = Fluttie();

    var checkAnimation =
        await instance.loadAnimationFromAsset("assets/eat.json");

    animationCtrl1 = await instance.prepareAnimation(
      checkAnimation,
      repeatMode: RepeatMode.START_OVER,
      repeatCount: RepeatCount.infinite(),
    );
    setState(() {
      animationCtrl1.start();
    });
  }

  prepareAnimation2() async {
    var instance = Fluttie();

    var checkAnimation =
        await instance.loadAnimationFromAsset("assets/sleep.json");

    animationCtrl2 = await instance.prepareAnimation(
      checkAnimation,
      repeatMode: RepeatMode.START_OVER,
      repeatCount: RepeatCount.infinite(),
    );
    setState(() {
      animationCtrl2.start();
    });
  }

  prepareAnimation3() async {
    var instance = Fluttie();

    var checkAnimation =
        await instance.loadAnimationFromAsset("assets/repeat.json");

    animationCtrl3 = await instance.prepareAnimation(
      checkAnimation,
      repeatMode: RepeatMode.START_OVER,
      repeatCount: RepeatCount.infinite(),
    );
    setState(() {
      animationCtrl3.start();
    });
  }

  prepareAnimation4() async {
    var instance = Fluttie();

    var checkAnimation =
        await instance.loadAnimationFromAsset("assets/code.json");

    animationCtrl4 = await instance.prepareAnimation(
      checkAnimation,
      repeatMode: RepeatMode.START_OVER,
      repeatCount: RepeatCount.infinite(),
    );
    setState(() {
      animationCtrl4.start();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 21, 49, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 36, 32, 72),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(22, 0, 0, 0),
                      offset: Offset(0, 12),
                      blurRadius: 19)
                ],
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          width: 110,
                          height: 110,
                          child: FluttieAnimation(animationCtrl1),
                        ),
                        SizedBox(height: 20),
                        Text('EAT',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 150,
                          child: FluttieAnimation(animationCtrl2),
                        ),
                        Text('SLEEP',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 150,
                          child: FluttieAnimation(animationCtrl3),
                        ),
                        Text('REPEAT',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 150,
                          child: FluttieAnimation(animationCtrl4),
                        ),
                        Text('CODE',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
