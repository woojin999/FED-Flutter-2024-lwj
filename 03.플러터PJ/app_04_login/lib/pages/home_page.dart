// 홈 페이지 /////

import 'package:app_04_login/components/logo.dart';
import 'package:app_04_login/size.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: xlargeGap),
            Logo('Dart Soft'),
            SizedBox(height: xlargeGap),
            TextButton(
              onPressed: () {
                // 현재는 갈곳이 없으므로 다시 로그인으로!
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Get Started'),
            )
          ],
        ),
      ),
    );
  }
}
