import 'package:flutter/material.dart';
import 'package:recipe_app/recipe.dart';

int _sliderVal = 1;

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text(widget.recipe.Label!),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl!),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.Label!,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white60,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Text(
                      style: TextStyle(
                        color: Colors.white60,
                      ),
                      '${ingredient.quantity! * _sliderVal} ${ingredient.measure} ${ingredient.name}');
                },
                itemCount: widget.recipe.ingredients.length,
              ),
            ),
            Slider(
                min: 1,
                max: 10,
                divisions: 10,
                label:'${_sliderVal * widget.recipe.servings} servings',
                value: _sliderVal.toDouble(),
                onChanged: (newValue) {
                  setState((){
                    _sliderVal=newValue.round();
                  });
                },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
