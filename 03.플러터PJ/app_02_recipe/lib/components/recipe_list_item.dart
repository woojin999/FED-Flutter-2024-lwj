// 황금 레시피 리스트 아이템 클래스 //////

import 'package:flutter/material.dart';

// 두개의 값을 전달 받아 처리한다!
// 1. 이미지이름 / 2. 타이틀
class RecipeListItem extends StatelessWidget {
  // 클래스 맴버속성 만들기
  final String imageName;
  final String title;
  // 클래스 호출할때 생성시 이 값을 전달해줌!

  // 맴버 속성을 셋팅하도록 생성자메서드를 변경한다!
  // key값 전달은 기본이므로 포함하여 변경한다!
  const RecipeListItem(this.imageName, this.title, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          // 1.이미지 : 맴버변수 imageName사용
          // 비율설정위젯 - AspectRatio
          AspectRatio(
            aspectRatio: 2 / 1,
            // 사각 잘라내기 위젯
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/$imageName.jpeg",
                // 이미지 확장 채우기(중요!!!)
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ), // 사이간격

          // 2.텍스트 : 맴버변수 title사용
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          // 3. 레시피 소개글
          Text(
            "당신은 당신이 직접만든 $title를 가지고 계신가요? 만약없다면 여기 쉽고 훌륭한 $title를 보고 따라해 보세요! 틀림없이 좋은 결과를 만나실 겁니다!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
