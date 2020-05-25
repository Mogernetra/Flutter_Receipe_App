import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:receipeflutterapp/model/receipe.dart';
import 'package:receipeflutterapp/ReceipeDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
//    String screenWidth =
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
                child: Stack(children: <Widget>[
              Container(
                  width: screenWidth,
                  height: screenHeight * 0.3,
                  child: Image.asset("images/apple.png", fit: BoxFit.cover,)),
              Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.7,
                        child: Card(
                          elevation: 9.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                  title: Text(
                                    "Fruit Recipes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                  ),
                                  subtitle: Text(
                                    "Enjoy one of your fruit recipes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  )),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20.0),
                                height: 226.0,
                                child: ListView.builder
                                  (
                                    scrollDirection: Axis.horizontal,
                                    itemCount: receipies.length,
                                    itemBuilder: (BuildContext ctxt, int index) {
                                      Receipe receipe = receipies[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, left: 50),
                                        child: InkWell(
                                          onTap: ()=>Navigator.push(context, MaterialPageRoute(
                                              builder: (_)=> ReceipeDetail(
                                                receipe: receipe,
                                              )
                                          )),
                                          child: Container(
                                              width: screenWidth * 0.45,
                                              height: screenHeight * 0.4,
                                              child: Stack(
                                                children: <Widget>[
                                                  Card(
                                                    color: Color(receipe.color),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Align(
                                                          alignment:
                                                          Alignment.topRight,
                                                          child: CircleAvatar(
                                                            radius: 50.0,
                                                            backgroundColor:
                                                            Colors.grey,
                                                            backgroundImage: AssetImage(
                                                                receipe.imagePath),
                                                          ),
                                                        ),
                                                        Text(
                                                          receipe.name,
                                                          textAlign:
                                                          TextAlign.start,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15.0,
                                                              fontStyle: FontStyle.italic,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),

                                                        Text(
                                                          receipe.description,
                                                          textAlign:
                                                          TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontStyle: FontStyle.italic
                                                          ),
                                                        ),
                                                        SizedBox(height: 15),
                                                        Text(
                                                          receipe.calories,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15.0,
                                                              fontStyle: FontStyle.italic,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      );
                                    }
                                ),
                              )
                            ],
                          ),
                        ),
                        decoration: new BoxDecoration(boxShadow: [
                          new BoxShadow(
                            color: Colors.grey.withOpacity(.5),
                            blurRadius: 10.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: Offset(
                              5.0, // Move to right 10  horizontally
                              0.0, // Move to bottom 10 Vertically
                            ),
                          ),
                        ])),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 400),
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.25,
                  child: Card(
                    child: Stack(
                      children: <Widget>[
                        Text("Your Favorites",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        SizedBox(height: 10,),
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(25),
                              child: Container(
                                height: screenHeight*0.16,
                                width: screenWidth*0.4,
                                child: Card(
                                  color: Color(receipies[1].color),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        receipies[2].name,
                                        textAlign:
                                        TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),


                                      CircleAvatar(
                                          radius: 30.0,
                                          backgroundColor: Color( receipies[1].color),
                                          backgroundImage: AssetImage(
                                              receipies[1].imagePath),
                                        ),


                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25),
                              child: Container(
                                height: screenHeight*0.16,
                                width: screenWidth*0.4,
                                child: Card(
                                  color: Color(receipies[2].color),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        receipies[2].name,
                                        textAlign:
                                        TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),


                                      CircleAvatar(
                                        radius: 30.0,
                                        backgroundColor: Color( receipies[2].color),
                                        backgroundImage: AssetImage(
                                            receipies[2].imagePath),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )


                      ],
                    )
                  ),
                ),
              ),

            ])),
          ],
        ),
      ),
    );
  }
}
