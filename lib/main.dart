import 'package:flutter/material.dart';
import 'package:recipe_app/recipe.dart';
import 'package:recipe_app/recipe_detail.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  final ThemeData theme = ThemeData();
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.white38,
          secondary: Colors.blueGrey,
        ),
      ),
      home: const MyHomePage(title: "Recipe Calculator"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: Recipe.samples.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RecipeDetail(
                            recipe: Recipe.samples[index],
                          );
                        },
                      ),
                    );
                  },
                  child: buildRecipeCard(Recipe.samples[index]));
            }),
      ),
    );
  }
}

Widget buildRecipeCard(Recipe recipe) {
  return Card(
    color: Colors.grey.shade800,
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(recipe.imageUrl!)),
          SizedBox(
            height: 14,
          ),
          Text(
            recipe.Label!,
            style: TextStyle(
                color: Colors.white60,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino'),
          )
        ],
      ),
    ),
  );
}
