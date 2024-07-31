// 프로파일 헤더파트 : 인물 사진 및 소개

import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  // 빌드 재정의
  @override
  Widget build(BuildContext context) {
    // 헤더파트는 가로로 진행하므로 Row를 만들고 리턴함!
    return Row(
      children: [
        SizedBox(width: 20), // 가로간격
        // 아마타 이미지 위젯함수 호출
        _buildHeaderAvatar(),
        SizedBox(width: 20), // 가로간격
        // 프로파일 헤더정보 위젯함수 호출
        _buildHeaderProfile(),
      ],
    );
  }
}

// 아마타 이미지 위젯함수 만들기 ///////
Widget _buildHeaderAvatar() {
  // 크기를 가지는 박스 위젯은 SizedBox()임!
  return SizedBox(
    width: 100,
    height: 100,
    // 둥근 이미지 아바타 만들기
    child: CircleAvatar(
      // 배경이미지로 넣기 : assets에 있는 이미지
      backgroundImage: AssetImage('assets/avatar.png'),
    ),
  );
}

// 프로파일 헤더정보 위젯함수 만들기 ////////
Widget _buildHeaderProfile() {
  // 정보의 배치가 수직형이므로 Column() 사용!
  return Column(
    // 기본정렬은 중앙정렬임! 왼쪽정렬변경하기
    // start - 왼쪽정렬 / end - 오른쪽정렬
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Jason Grimmer",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        "Programmer/Designer",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      Text(
        "Flutter Programming",
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    ],
  );
}
