// 프로파일 카운트 정보 : 컨텐츠 카운트 정보 클래스

import 'package:flutter/material.dart';

class ProfileCountInfo extends StatelessWidget {
  const ProfileCountInfo({Key? key}) : super(key: key);

  // 빌드 재정의!
  @override
  Widget build(BuildContext context) {
    return Row(
      // 컨텐츠 주변을 일정한 공간으로 채우기
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // 정보위젯 : _buildInfo()
        // 사이구분선 : _buildLine()
        _buildInfo("102", "Posts"),
        _buildLine(),
        _buildInfo("70", "Likes"),
        _buildLine(),
        _buildInfo("20", "Share"),
      ],
    );
  }
}

// 정보위젯 만들기 : 전달값 (카운트숫자, 타이틀문구)
Widget _buildInfo(String count, String title) {
  // 세로 배치니까 Column위젯을 만들어서 리턴함!
  return Column(
    children: [
      // 카운트 숫자 텍스트
      Text(
        count,
        style: TextStyle(fontSize: 15),
      ),
      // 타이틀 텍스트
      Text(
        title,
        style: TextStyle(fontSize: 17),
      ),
    ],
  );
}

// 사이구분선 만들기 함수
Widget _buildLine() {
  return Container(
    width: 2,
    height: 60,
    color: Colors.blue,
  );
}
