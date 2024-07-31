// 황금 레시피 타이틀 클래스 ////

import 'package:flutter/material.dart';

class RecipeTitle extends StatelessWidget {
  const RecipeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 상단여백 : only(top/left/right/bottom)
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Text(
          "황금 레시피",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
