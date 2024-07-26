// [다트의 함수]
  // - 특정실행코드를 호출시 실행하기 위한
  // 코드 저장소!
  /*
    1. 일반함수
    형식: 
      데이터형 함수명(전달변수){코드구역}
      - 데이터형 : 함수에서 값을 리턴할 데이터형
        -> 리턴값이 없는 함수는 반드시 void 라고 써줘야한다!
      - 전달변수 : 데이터형과 함께 변수로 표현
    
    예) int myFn (int aa){return aa + 100;}
    -> 정수형숫자를 받아서 100을 더한후 int형으로 리턴

    2. 익명함수 : 이름없는 함수
    -> 다른함수에 실행코드를 전달할 경우 주로 사용됨
    형식 : (){코드}
    예) 호출 -> 함수명((){코드})
        받음 -> void 함수(Function ff) { ff();}

    3. 람다함수 : 
    함수형 변수로 선언후 화살표로 리턴/실행코드 작성
    형식 : Function 함수명 = (전달변수) => 코드;
    -> 특징: return키워드 없어도 자동리턴처리됨!

   */

// 처음 시작하는 필수 함수 main //
void main(){
  showText('이순신에 대해 알아볼까요');
  showText('이순신의 마지막 전투는?${leeFight[2]}${detail[leeFight[2]]??"부제목 없음"}');
  showText(makeSubTit(2));
  showText(makeSubTit(1));
  showText(makeSubTit(0));

  // 이순신 시리즈 영화 주요출연자 찍기
  // Set 상수를 List로 형변환하여 함수에 전달!
  showText('이순신 시리즈 영화 주요출연배우들:${actorList(actors.toList())}');

  // 다음 추가 이순신 시리즈가 있다면 어느배우를  추천하는가?
  showText('다음 이순신 시리즈가 있다면 추천배우는 공유다!');
  showText('공유의 취미는 ${recommActor['공유']?['취미']}다! 사는곳은 ${recommActor['공유']?['사는곳']}다! 공유의 자동차는 ${recommActor['공유']?['자동차']??"정보없음"}이다!');
  showText('조인성의 취미는 ${recommActor['조인성']?['취미']}다! 사는곳은 ${recommActor['조인성']?['사는곳']}다! 조인성의 자동차는 ${recommActor['조인성']?['자동차']??"정보없음"}이다!');

  // [다트문법 널세이프티 적용사례]
  // -> Map형 데이터일 경우 내부 속성 불일치 등으로
  // null이 나올때 에러로 연결되므로 이런 경우에 다트는 필수적으로 널 세이프티 처리를 강제한다
  // 물음표 하나는 null일경우 "null" 문자열 출력대체
  // 물음표두개(??)는 null발생시 문자열 대체한 경우 커스터마이징 대체문자열을 출력하게 해준다

  // 익명함수를 만들어서 특정함수에 값으로 전달한다
  japanShip((){print('개박살일본배침몰');});

  showText('아직 신에게는 ${minus()}척의 배가 남았습니다');
  showText('아직 신에게는 ${minus()}척의 배가 남았습니다');
  showText('아직 신에게는 ${minus()}척의 배가 남았습니다');
  showText('아직 신에게는 ${minus()}척의 배가 남았습니다');
  showText('아직 신에게는 ${minus()}척의 배가 남았습니다');
  showText('아직 신에게는 ${minus()}척의 배가 남았습니다');

  showText('이순신의 부하중 이순신이있었다. ' + '그는 전투전에 너무 긴장되어서 구구단을 외웠다! 9단!');
  // 구구단 출력~!
  showgugu(9);
  showText('옆사람도 불안하여 7단을 외움');
  showgugu(7);
} //// main ////

// 추천배우 변수
// const Map<String,Map> recommActor = {
const recommActor = {
  '조인성': {'나이': 42, '하비': '날기', '사는곳': '아무데나','자동차':'페라리'},
  '공유': {'나이': 45, '취미': '비오게하기', '사는곳': '공유하우스'}
};

// [다트의 상수: const, final ]
final leeFight = ['명량','한산','노량'];
const detail = {'명량': '해전', '한산': '도대첩', '노량': '해전'};
final subTit = {'명량': null, '한산': '용의 출현', '노량': '죽음의 바다'};
// 이순신 시리즈 영화 출연배우들
// List 중복제거는 Set
final actors = {
  '박해일',
  '변요한',
  '최민식',
  '안성기',
  '최민식',
  '류승룡',
  '조진웅',
  '최민식',
  '김윤석',
  '김명곤',
  '진구',
  '이정현',
  '김윤석',
  '김윤석',
  '백윤식',
  '김윤석',
  '정재영',
  '허준호',
  '김윤석',
  '김성규',
  '이규형',
  '이무생',
  '최덕문',
  '안보현',
  '박명훈',
  '안보현',
  '박훈',
  '문정희'
};

// 1. 텍스트 찍기 함수 //
void showText(var txt){
  print(txt);
} /// showTxt ////

// 2. 이순신 시리즈 영화 부제목 찍기 함수
// 리턴값의 형은 String
// 전달값의 형은 int (List상수의 순번값)
String makeSubTit(int seq){
  return '영화 ${leeFight[seq]}의 부제목은?' +
  '${subTit[leeFight[seq]]??"부제목 없음"}';
} ///makeSubTit 함수 ///

  // [ 다트의 널 세이프티(Null Safety) ]
  // - 개발자가 null 데이터가 생길 경우 에러를 막기 위한
  // 조치를 다트언어에서 시스템적으로 처리해주는 기법
  // 1. 널체크 연산자 : ? - 널값 여부체크
  // 2. 널병합 연산자 : ?? - 널인경우 뒤에 쓴값 출력

// 3. 배우리스트르 찍기 함수 ///
  String actorList(List list){
  var temp = '';
  // for문 : for(시;한;증){코드}
  // 리스트를 순회하는 for문  
  for (var x in list) { // x - list의 개별값 순회
    temp += '🎈$x';
  }
  // 문자형으로 리턴값 설정
  return temp;
  } ///// actorList ////

  // 4. 익명함수를 함수호출시 전달하여 실행하게하는 함수
  void japanShip(Function bomb){ // bomb - 전달익명함수
  showText('나는 일본배야');
  // 전달된 함수실행
  bomb();
  } //// japanShip 함수 ///

  // 배숫자변수
  int shipNum = 13;

  // 5. 람다함수로 숫자를 줄이는 람다함수 만들기
  Function minus = () => --shipNum;

  // 6. 구구단함수 ///
  void showgugu(int x) {
    // 9단일때 아이콘 다름, 나머진 같음
    String icon = "";

    if (x==9) {
      icon = "🎗";
    }else{
      icon= "🏏";
    }
    print('$icon $x 단');

    for (var i = 1; i <= 9; i++) {
      print("$x × $i ＝ ${x*i}");
    } /// for ///
  } //////// showgugu 함수 ////////////



