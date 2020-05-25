import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receipeflutterapp/HealthBenifit.dart';
import 'package:receipeflutterapp/model/receipe.dart';

class ReceipeDetail extends StatefulWidget {
  final Receipe receipe;

  const ReceipeDetail({Key key, this.receipe}) : super(key: key);

  Receipe getSmoothie() {
    print(receipe);
    return receipe;
  }

  List<Ingredient> getIngredients() {
    print(receipe.ingredients);
    return receipe.ingredients;
  }

  @override
  _SmoothDetailState createState() => _SmoothDetailState();
}

class _SmoothDetailState extends State<ReceipeDetail> {
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
                        trailing:   RaisedButton(
                          onPressed:()=>Navigator.push(context, MaterialPageRoute(
                              builder: (_)=> HealthBenifit(
                                  receipe : widget.receipe
                              )
                          )),
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: const Text( 'Calories',
                                style: TextStyle(fontSize: 20)
                            ),
                          ),
                        ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 250),
                      child: Text(
                        "Ingredients",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.receipe.ingredients.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              print(index);
                              Ingredient ind =
                                  widget.receipe.ingredients[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: AssetImage(ind.image),
                                      ),
                                      title: Text(
                                        ind.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                        ),
                                      ),
                                      trailing: Column(
                                        children: <Widget>[
                                          Text(
                                            ind.quantity,
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 20),
                                    child: Divider(
                                      thickness: 0.5,
                                      color: Colors.black12,
                                    ),
                                  ),
                                ],
                              );
                            })
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 250),
                      child: Text(
                        "Directions",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: widget.receipe.directions.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              print(index);
                              String dir = widget.receipe.directions[index];
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

                  /*  ListTile(
                        leading: Icon(Icons.arrow_forward),
                        subtitle: Text(
                          "A refreshing and increadible tasting fruit salad",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        )),
                    ListTile(
                        leading: Icon(Icons.arrow_forward),
                        subtitle: Text(
                          "A refreshing and increadible tasting fruit salad",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        )),
                    ListTile(
                        leading: Icon(Icons.arrow_forward),
                        subtitle: Text(
                          "A refreshing and increadible tasting fruit salad",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        )),*/
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
