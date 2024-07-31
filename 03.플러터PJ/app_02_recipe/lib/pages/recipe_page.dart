// 황금 레시피 페이지홈 클래스 ////

import 'package:flutter/material.dart';
// 쿠퍼티노 아이콘 사용위해 쿠퍼티노앱 추가
import 'package:flutter/cupertino.dart';

// 레시피 컴포넌트 불러오기 : 타이틀, 메뉴, 리스트아이템
import 'package:app_02_recipe/components/recipe_title.dart';
import 'package:app_02_recipe/components/recipe_menu.dart';
import 'package:app_02_recipe/components/recipe_list_item.dart';

class RecipePage extends StatelessWidget {
  // 생성자 메서드에서 key를 받아서 부모 속성을 셋팅함
  // key는 이미만들어진 부모위젯에서 받는 기본값
  // 이 값은 우리가 넘겨주지 않아도 셋팅은 되어야함!
  const RecipePage({Key? key}) : super(key: key);
  // Key? key -> Key클래스 형 변수 key가 null이어도
  // 그 값을 null처리 하지 않고 "null"문자열로 처리해줌!
  // -> 널 세이프티(null safety)라고 한다!(물음표사용!)

  // build 메서드를 재정의함!
  @override
  Widget build(BuildContext context) {
    // 가장 바깥쪽 레이아웃 Scaffold 위젯으로 시작!
    return Scaffold(
      // 1. 전체 배경색 설정하기
      backgroundColor: Colors.white,
      // 2. 앱바구현 메서드 호출하기
      appBar: _buildRecipeAppBar(),
      // 3. body 구현하기

      body: Padding(
        // 상하/좌우 대칭 여백패딩설정(symmetric:대칭적인)
        // symmetric(horizontal:숫자,vertical:숫자)
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
        // const EdgeInsets.symmetric(horizontal: 20),
        // Column 위젯대신 ListView 위젯을
        // 사용해야 스크롤바 표시가 된다!
        child: ListView(
          children: [
            // 1.레시피 페이지 전체타이틀
            RecipeTitle(),
            // 2.레시피 페이지 메뉴
            RecipeMenu(),
            // 3.레시피 페이지 아이템
            RecipeListItem('coffee', '커피 레시피'),
            RecipeListItem('burger', '수제버거 레시피'),
            RecipeListItem('pizza', '피자 레시피'),
          ],
        ),
      ),
    );
  }
}

// 앱바 클래스 만들기 ////////
// 리턴형은 AppBar
// 앱바 메서드 이름은 주로 (언더바_)로 시작함
AppBar _buildRecipeAppBar() {
  return AppBar(
    // 앱바 배경색
    backgroundColor: const Color.fromARGB(255, 226, 226, 226),
    // elevation속성 :앱바 그림자효과 조정속성
    elevation: 1.0,
    // actions 속성 : 앱바 컨텐츠 파트[리스트형]
    actions: [
      // 아이콘 위젯 - Icon
      Icon(
        // 아이콘 옵션중 쿠퍼티노가 유명함
        // 주의: 쿠퍼티노앱 상단 import 추가!
        CupertinoIcons.search,
        color: Colors.blueGrey,
      ),
      SizedBox(
        width: 15,
      ), //사이간격박스
      Icon(
        CupertinoIcons.heart,
        color: Colors.redAccent,
      ),
      SizedBox(
        width: 15,
      ), //사이간격박스
    ],
  );
} //// _buildRecipeAppBar 메서드 //////

// 앱바는 앱 최상단 구역을 차지하며
// 구성요소로는 
// 1. leading - 앱바 상단왼쪽끝파트
// 2. title - 앱바 타이틀파트
// 3. actions - 앱바 컨텐츠파트
// 4. flexibleSpace - 앱바 하단파트 위 공간
// -> SafeArea위젯에서 이 공백을 자동조정함!
// 5. bottom - 앱바 하단파트
