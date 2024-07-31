import 'package:flutter/material.dart';
// 전체테마 파일 불러오기
import 'package:app_03_profile/theme.dart';
// 프로파일 헤더영역 불러오기
import 'package:app_03_profile/components/profile_header.dart';
// 사이드 박스 드로워 불러오기
import 'package:app_03_profile/components/profile_drawer.dart';
// 프로파일 카운트 정보 불러오기
import 'package:app_03_profile/components/profile_count_info.dart';
// 프로파일 버튼 불러오기
import 'package:app_03_profile/components/profile_buttons.dart';
// 프로파일 탭영역 불러오기
import 'package:app_03_profile/components/profile_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // 앱 빌드 위젯 재정의!
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 디버그 모드 지우기
      debugShowCheckedModeBanner: false,
      // 테마를 위한 클래스를 만들고 메서드를 불러오기
      theme: theme(),
      // 메인 홈 지정하기
      home: ProfilePage(),
    );
  }
}

// 프로파일 페이지 구성 클래스 만들기
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  // build 재정의!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 사이드 박스 드로워는 drawer -> 왼쪽에서 들어옴
      // endDrawer -> 오른쪽에서 들어옴
      // 기본작동은 햄버거 터치시 들어옴/ 빈곳 터치시 나감
      endDrawer: ProfileDrawer(),
      // 상단 앱바 만들기 함수 호출 : 기본앱바
      // 드로워가 있으면 햄버거 아이콘이 출력됨!
      appBar: _buildProfileAppBar(),
      // 본문파트인 바디구성하기
      body: Column(
        children: [
          SizedBox(height: 20), // 위아래 간격
          // 1.프로파일 헤더파트 : 인물 사진 및 소개
          ProfileHeader(),
          SizedBox(height: 20), // 위아래 간격
          // 2.프로파일 카운트 정보 : 컨텐츠 카운트 정보
          ProfileCountInfo(),
          SizedBox(height: 20), // 위아래 간격
          // 3.프로파일 버튼
          ProfileButtons(),
          // 4.프로파일 탭영역 : 끝부분까지 확장함! -> Expanded()사용!
          Expanded(child: ProfileTab()),
        ],
      ),
    );
  }
}

// 앱바생성 함수
AppBar _buildProfileAppBar() {
  return AppBar();
}
