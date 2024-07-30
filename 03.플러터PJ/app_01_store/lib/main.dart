import 'package:flutter/material.dart';
// 보통 material.dart 가져다가 사용함

// 최초 실행 함수 main //
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // @override는 기존 클래스를 재정의 함을 표시
  // @오버라이드는 재정의, 오버로드는 같은 이름의 메서드 다중정의 
  @override
  // 최상위 위젯 : 전체 틀을 잡아줌
  // 모든 기본 단위 위젯을 리턴코드를 가짐
  Widget build(BuildContext context) {
    return MaterialApp(
      // "DEBUG" 글자 오른쪽 상단 글자 없앰
      debugShowCheckedModeBanner: false,
      // 탭바에 출력된 타이틀
      title: 'STORE APP',
      // 필요시 디자인 테마 적용
      theme: ThemeData(),
      // home에 작성하는 위젯이 실제 이 앱이 표시는 위젯임
      home: ,
    );
  }
}

// StorePage 클래스 만들기
// -> 비상태 관리 위젯 단축키: stl
class StorePage extends StatelessWidget {
  // 기본적으로 생성자 메서드에서 부모키를 셋업함
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // BuildContext 클래스는 위젯 묶을을 만들어주는 역할을함
    // 리턴코드: 스케폴드 클래스로 비상태관리 코드를 만들어준다
    return Scaffold(
      // 상단영역 아래 body 파트를 표시하는 속성
      body: SafeArea(
        // 앱의 기본방향 시작은 세로방향임(Colum이다-Row를 포함한다)
        // body의 구성요소는 child속성으로 표현
        child: Column(
          // children 속성은 컬럼하위 요소들
          
        ),
      ),
    );
  }
}




