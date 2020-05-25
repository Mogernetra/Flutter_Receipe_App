import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receipeflutterapp/HealthBenifit.dart';
import 'package:receipeflutterapp/model/receipe.dart';

class HealthBenifit extends StatefulWidget {
  final Receipe receipe;

  const HealthBenifit({Key key, this.receipe}) : super(key: key);

  Receipe getSmoothie() {
    print(receipe);
    return receipe;
  }

  List<Ingredient> getIngredients() {
    print(receipe.ingredients);
    return receipe.ingredients;
  }

  @override
  _HealthBenifitState createState() => _HealthBenifitState();
}

class _HealthBenifitState extends State<HealthBenifit> {
  @override
  Widget build(BuildContext context) {
    print(widget.receipe);
    print(widget.receipe.ingredients);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
                child: Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(children: <Widget>[
                        Container(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  color: Color(widget.receipe.color),
                                  width: screenWidth,
                                  height: screenHeight * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 200),
                                    child: CircleAvatar(
                                      radius: 50.0,
                                      backgroundColor: Colors.grey,
                                      backgroundImage: AssetImage(widget.receipe.imagePath),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 120,
                                  ),
                                  child: Container(
                                    width: screenWidth * 1,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40),
                                            topRight: Radius.circular(40)),
                                        border: Border.all(
                                          width: 0,
                                          color: Colors.white,
                                        )),
                                    child: Column(
                                      children: <Widget>[
                                        Divider(
                                          thickness: 7,
                                          color: Colors.black12,
                                          indent: 150,
                                          endIndent: 150,
                                        ),
                                        ListTile(
                                          title: Text(
                                            widget.receipe.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500, fontSize: 20),
                                          ),
                                          subtitle: Text(
                                            widget.receipe.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400, fontSize: 15),
                                          ),

                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            FlatButton(
                                              color: Colors.blue,
                                              textColor: Colors.white,
                                              disabledColor: Colors.grey,
                                              disabledTextColor: Colors.black,
                                              padding: EdgeInsets.all(8.0),
                                              splashColor: Colors.blueAccent,
                                              onPressed: () {
                                                /*...*/
                                              },
                                              child: Text(
                                                widget.receipe.calories,
                                                style: TextStyle(fontSize: 20.0),
                                              ),
                                            ),

                                          ],
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(right: 200, top: 10),
                                          child: Text(
                                            "Health Benifits",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500, fontSize: 18),
                                          ),
                                        ),


                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                itemCount: widget.receipe.benifits.length,
                                                itemBuilder: (BuildContext ctxt, int index) {
                                                  print(index);
                                                  String dir = widget.receipe.benifits[index];
                                                  return ListTile(
                                                      leading: Icon(Icons.arrow_forward),
                                                      subtitle: Text(
                                                        dir,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w400, fontSize: 15),
                                                      )) ;
                                                })
                                          ],
                                        ),

                                        Row(
                                          children: <Widget>[
                                            MaterialButton(
                                              onPressed: () {},
                                              color: Colors.red,
                                              textColor: Colors.white,
                                              child: Icon(
                                                Icons.favorite,
                                                size: 24,
                                              ),
                                              padding: EdgeInsets.all(16),
                                              shape: CircleBorder(),
                                            ),
                                            MaterialButton(
                                              onPressed: () {},
                                              color: Colors.cyan,
                                              textColor: Colors.white,
                                              child: Icon(
                                                Icons.add_shopping_cart,
                                                size: 24,
                                              ),
                                              padding: EdgeInsets.all(16),
                                              shape: CircleBorder(),
                                            ),
                                            MaterialButton(
                                              onPressed: () {},
                                              color: Colors.indigo,
                                              textColor: Colors.white,
                                              child: Icon(
                                                Icons.thumb_up,
                                                size: 24,
                                              ),
                                              padding: EdgeInsets.all(16),
                                              shape: CircleBorder(),
                                            ),
                                            MaterialButton(
                                              onPressed: () {},
                                              color: Colors.lightGreen,
                                              textColor: Colors.white,
                                              child: Icon(
                                                Icons.comment,
                                                size: 24,
                                              ),
                                              padding: EdgeInsets.all(16),
                                              shape: CircleBorder(),
                                            )
                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ]),
                    )))));
  }
}
