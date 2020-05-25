class Receipe {
  String name;
  String title;
  String imagePath;
  int color;
  String description;
  String calories;
  List<Ingredient> ingredients;
  List directions;
  List benifits;
  Receipe(
      {this.name,
      this.title,
      this.imagePath,
      this.calories,
      this.description,
      this.color,
      this.ingredients,
      this.directions,
      this.benifits});

  factory Receipe.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['images'] as List;
    print(list.runtimeType);
    List<Ingredient> imagesList =
        list.map((i) => Ingredient.fromJson(i)).toList();

    return Receipe(ingredients: imagesList);
  }
}

class Ingredient {
  String image;
  String name;
  String quantity;

  Ingredient({this.image, this.name, this.quantity});

  factory Ingredient.fromJson(Map<String, dynamic> parsedJson) {
    return Ingredient(
        image: parsedJson['image'],
        name: parsedJson['name'],
        quantity: parsedJson['quantity']);
  }
}

List receipies = [
  Receipe(
      name: "Fruit Salad",
      title: "A refreshing and incredible tasting fruit salad",
      imagePath: "images/fruitesalad.png",
      color: 0xFF4DD0E1,
      calories: "248KCal",
      description:
          "It includes higenic proteins & vitamin. More importantly it's very sweet & healthy",
      directions: [
        "Prepare fruit: chop fruits (except blueberries) and add to a large mixing bowl.",
        "Make dressing: in a small mixing bowl, whisk together they honey, lime zest and lime juice.",
        "Toss fruit with dressing: pour dressing over fruit just before serving and toss to evenly coat.",
      ],
      benifits: [
        "Eating a diet rich in fruit may reduce risk for stroke, other cardiovascular diseases and type-2 diabetes.",
        "A fruit containing eating pattern is part of an overall healthy diet and may protect against certain cancers.",
        "Fruit helps maintain optimum health due to the health promoting phytochemicals it contains – many of which are still being identified.",
      ],
      ingredients: [
        Ingredient(
            image: "images/strawberry.jpg",
            name: "Strawberries",
            quantity: "400g"),
        Ingredient(
            image: "images/blueberries.jpg",
            name: "Blueberries",
            quantity: "400g"),
        Ingredient(image: "images/kivi.jpg", name: "Kivi", quantity: "400g"),
        Ingredient(image: "images/mango.jpg", name: "Mango", quantity: "400g")
      ]),
  Receipe(
    name: "Fruit Ice Cream",
    title:
        "Fruit Salad with Ice Cream is a delicious ice-cream recipe that you can enjoy with your family ",
    imagePath: "images/icecream.jpg",
    color: 0xFF4DB6AC,
    calories: "248KCal",
    description: "Fruit Salad with Ice Cream is a delicious ice-cream",
    directions: [
      "To prepare this delicious dessert recipe, wash and clean a glass bowl or a glass cup. Add mixed dry fruits, sugar syrup and chopped mixed fruits in it.",
      "Then, add a scoop of vanilla ice-cream into it and top up with halved strawberries. Serve chilled. (Optional: You can top it with wafers to add crunchiness to the dessert.)",
    ],
    benifits: [
      "Eating a diet rich in fruit may reduce risk for stroke, other cardiovascular diseases and type-2 diabetes.",
      "A fruit containing eating pattern is part of an overall healthy diet and may protect against certain cancers.",
      "Fruit helps maintain optimum health due to the health promoting phytochemicals it contains – many of which are still being identified.",
    ],
    ingredients: [
      Ingredient(
          image: "images/fruitcup.jpg",
          name: "cup mixed fruits sliced",
          quantity: "1 cup"),
      Ingredient(
          image: "images/strawberry.jpg",
          name: "strawberry halved",
          quantity: "4 number"),
      Ingredient(
          image: "images/sugar.jpg",
          name: "sugar syrup",
          quantity: "2 Tea Spoon"),
      Ingredient(
          image: "images/venilla.jpg",
          name: "scoop vanilla ice cream",
          quantity: "1")
    ],
  ),
  Receipe(
      name: "Yogurt Parfait",
      title: "Tart grapefruit and lime are balanced with a bit of honey in this cool and easy parfait. —Lois Enger, Colorado Springs, Colorado",
      imagePath: "images/fruitesalad.png",
      color: 0xFF424242,
      calories: "248KCal",
      description:
          "It includes higenic proteins & vitamin. More importantly it's very sweet & healthy",
      directions: [
        "Cut a thin slice from the top and bottom of each grapefruit; stand fruit upright on a cutting board. With a knife, cut off peel and outer membrane from grapefruit. Cut along the membrane of each segment to remove fruit.",
        "In a large bowl, mix yogurt, lime zest and juice. Layer half of the grapefruit and half of the yogurt mixture into 6 parfait glasses. Repeat layers. Drizzle with honey; top with mint.",
        "Toss fruit with dressing: pour dressing over fruit just before serving and toss to evenly coat.",
      ],
      benifits: [
        "Eating a diet rich in fruit may reduce risk for stroke, other cardiovascular diseases and type-2 diabetes.",
        "A fruit containing eating pattern is part of an overall healthy diet and may protect against certain cancers.",
        "Fruit helps maintain optimum health due to the health promoting phytochemicals it contains – many of which are still being identified.",
      ],
      ingredients: [
        Ingredient(
            image: "images/strawberry.jpg",
            name: "Red grapefruit",
            quantity: "4 large"),
        Ingredient(
            image: "images/blueberries.jpg",
            name: "Lime juice",
            quantity: "2 tablespoons"),
        Ingredient(
            image: "images/strawberry.jpg",
            name: "reduced-fat plain yogurt",
            quantity: "4 Cups"),
        Ingredient(
            image: "images/mango.jpg",
            name: "Honey",
            quantity: "3 table spoons"),
        Ingredient(
            image: "images/mango.jpg",
            name: "Grated lime zest",
            quantity: "2 teaspoons"),
        Ingredient(
            image: "images/mango.jpg",
            name: "Torn fresh mint leaves",
            quantity: "2")
      ]),
];
