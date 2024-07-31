// 황금 레시피 페이지 메뉴 클래스 /////

import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  const RecipeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          // 박스형 메뉴 생성 메서드호출
          _buildMenuItem(
            Icons.food_bank,
            'All',
          ),
          Spacer(),
          _buildMenuItem(
            Icons.emoji_food_beverage,
            'Coffee',
          ),
          Spacer(),
          _buildMenuItem(
            Icons.fastfood,
            'Burger',
          ),
          Spacer(),
          _buildMenuItem(
            Icons.local_pizza,
            'Pizza',
          ),
        ],
      ),
    );
  }
}

// 메뉴구성 위젯을 리턴하는 메서드
// 하위 메서드 이므로 언더바로 시작하는 이름사용!
// 각 메뉴별 변경요소 전달값으로 받아서 처리!
// 전달변수: 1. 아이콘 / 2. 텍스트
Widget _buildMenuItem(IconData mIcon, String text) {
  // 박스를 구성하는 Container 위젯!
  // 박스는 크기를 가진다! 따라서 width,height 속성이필수!
  return Container(
    // 1. 가로, 세로 크기지정
    width: 70,
    height: 80,

    // 2. 박스 세부옵션 설정 - decoration
    decoration: BoxDecoration(
        // 보더속성
        border: Border.all(color: Colors.black12),
        // 보더 라운드 속성
        borderRadius: BorderRadius.circular(10),
        // 그라데이션 속성
        gradient: LinearGradient(
          // 그라데이션 색상지정
          colors: [
            Color.fromARGB(255, 238, 206, 105),
            Color.fromARGB(255, 193, 133, 19),
            Color.fromARGB(255, 253, 249, 201),
            Color.fromARGB(255, 238, 206, 105),
            Color.fromARGB(255, 255, 249, 184),
          ],

          // 각 색상이 어디까지 변화할지 지정(0.0~1.0)
          stops: [
            0.1,
            0.2,
            0.4,
            0.7,
            0.8,
          ],
          // 그라데이션 시작위치/끝위치 지정
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),

    // 3. 박스 하위요소 속성 : 단일요소 -> child
    child: Column(
        // 박스 세로정렬 중앙
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 3-1. 아이콘
          Icon(
            mIcon,
            color: Colors.redAccent,
            size: 30,
          ),
          // 내가 원하는 크기만큼 사이간격주는
          // 방법은 SizedBox(width/height)
          SizedBox(
            height: 3,
          ),
          // 3-2. 글자
          Text(
            text,
            style: TextStyle(
              color: Colors.red.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )
        ]),
  );
}
