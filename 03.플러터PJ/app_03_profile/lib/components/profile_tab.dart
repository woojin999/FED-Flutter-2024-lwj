// 프로파일 탭메뉴와 탭컨텐츠 구현 클래스

// 동적인 컨텐츠 변경이 있는 위젯은
// 상태위젯을 사용한다!!! -> StatefulWidget
// -> stf 축약어
import 'package:flutter/material.dart';

// 탭메뉴 구현 메인 클래스 ////////////
class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  // 기본적으로 상태관리를 해주는 메서드로 이를 생성함
  // createState() 에 실제 구현코드를 리턴하는 클래스를 연결함
  @override
  State<ProfileTab> createState() => _ProfileTabState();
} //// ProfileTab 클래스 ///////////

// 참고 : State<ProfileTab>
// 추상클래스<클래스형> -> 꺽쇠가로를 사용하는 형지정형식을
// "제네릭" 이라고 부름! 어떤형이든지 이렇게 표현가능함
// -> 지정된 형식의 내부type을 지정해주는 것이 제네릭이다!
// 예) Map<String,String> actor = {"이름":"강동원","나이":"40"};

// 실제 탭메뉴 구현 코드를 리턴하는 클래스
class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  // 다중상속으로 "씽글티커프로바이더스테이트믹스인" 클래스상속
  // -> 한가지의 애니메이션을 변경시 적용해주는 클래스임!
  // -> 탭메뉴 변경시 컨텐츠를 슬라이딩 애니로 이동해서 보여줌
  // 참고) 다중 애니메이션 정의 클래스는
  // TickerProviderStateMixin 을 상속받아 사용함!

  // 빌드 메서드 재정의!
  @override
  Widget build(BuildContext context) {
    // 컨텐츠 진행방향이 수직이므로 Column() 사용!
    return Column(
      children: [
        // 1. 탭바 메뉴 : _buildTabBar()
        _buildTabBar(),
        // 2. 탭 컨텐츠 영역
        // (확장영역사용-Expanded()) : _buildTabBarView()
        Expanded(child: _buildTabBarView()),
      ],
    );
  } //// build ///

  // 탭메뉴를 탭하여 컨텐츠를 변경할 것이므로
  // 탭컨트롤러가 필요함!!!
  TabController? _tabController;

  // 기존 정의된 탭컨트롤러를 초기화해야함!!!
  // 처음 로딩시 단 한번만 실행하여 초기화한다!
  @override
  void initState() {
    // 1.부모 클래스인 State()의 초기화 메서드를 호출함!
    super.initState();
    // 2.탭컨트롤로 변수에 탭컨트롤로 옵션을 설정하여 할당함!
    _tabController = TabController(length: 2, vsync: this);
    // length 속성 : 사용할 탭개수
    // vsync 속성 : 탭변경시 탭메뉴와 탭뷰를 연결하는 설정
    // -> this 키워드로 현재 탭자신을 등록함!
  } // initState 재정의 /////

  // [1] 탭바 위젯 리턴 메서드 : _buildTabBar()
  Widget _buildTabBar() {
    // 탭바 위젯 리턴 ////
    return TabBar(
      // 반드시 컨트롤로를 연결해줘야함!!! 중요!!!
      controller: _tabController,
      // 탭바안에 탭이 2개!
      tabs: [
        Tab(
          icon: Icon(
            Icons.photo_camera,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.photo,
          ),
        ),
      ],
    );
  } /////////// _buildTabBar 메서드 ///////

  // [2] 탭바뷰 위젯 리턴 메서드 : _buildTabBarView()
  Widget _buildTabBarView() {
    // 탭바뷰 위젯 리턴
    return TabBarView(
      // 반드시 컨트롤로를 연결해줘야함!!! 중요!!!
      controller: _tabController,
      // 탭개수가 2개이므로 2개의 탭바뷰를 구성함!
      children: [
        // GridView 위젯을 사용하여 이미지를 격자로 보여준다
        // 정해진 이미지를 가져오지 않고 웹상의 이미지정보를
        // 가져오려면 GridView.builder 를 사용해야한다!
        GridView.builder(
          // 그리드 위임속성 : 연결된 이미지를 하나씩 그리드에 배치할 수 있게 하는 크로스축 카운트를 등록함
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // 그리드의 주축(mainAxis)은 수직방향이다!
            crossAxisCount: 3, // 수평방향 3개 컨텐츠
            crossAxisSpacing: 10, // 수평방향 사이간격
            mainAxisSpacing: 10,
          ),
          // 전체 아이템 개수 지정(3개씩 14줄 만들예정)
          itemCount: 42,
          // 실제 아이템을 빌드하는 속성(중요!!!)
          // 함수형으로 값을 셋팅함
          // 함수 전달변수는 context는 셋팅된 모든 인트턴스정보
          // index 는 아이템을 돌면서 카운트되는 순번(0부터!)
          itemBuilder: (context, index) {
            // debugPrint('순번:$index/컨텍스트:$context');

            // 반드시 내부에서 결과를 리턴해야함!
            // 이미지를 네트워크로 불러오는 위젯을 사용!
            // 서비스 제공사이트 : https://picsum.photos/
            // 요청URL 구성 :
            // https://picsum.photos/id/237/200/300
            // https://picsum.photos/id/이미지번호/가로크기/세로크기
            // -> 이미지 번호는 1번부터 시작함!(index를 활용하여변경)
            return Image.network(
                "https://picsum.photos/id/${index + 1}/200/200");
            // return Image.asset('avatar.png');
          },
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 수평방향 3개 컨텐츠
            crossAxisSpacing: 10, // 수평방향 사이간격
            mainAxisSpacing: 10,
          ),
          itemCount: 42,
          itemBuilder: (context, index) {
            return Image.network(
                // 위의 43번 이미지부터 보이기 +43
                "https://picsum.photos/id/${index + 43}/200/200");
          },
        ),

        // Container(color: Colors.blue,),
        // Container(color: Colors.yellow,),
      ],
    );
  } /////////// _buildTabBarView 메서드 ///////
} //// _ProfileTabState 클래스 /////////////
