// 01. 다트문법 1 : 변수사용하기

// main 메서드를 가장먼저 호출한다

// void는 리턴값이 없다는 표시
void main(List<String> args) {
  // 1. var 선언변수
  // var는 할당되는 값으로 형이 결정되는 자유로운 변수 선언형식이다
  // 단, 처음에 할당한 형식으로만 재할당가능

  var myHome = "내집";
  // 출력은 print()
  print(myHome);

  // myHome = 32;
  // 처음에 넣은 데이터형과 다른형은 할당불가
  myHome = "너의집도 매우 크다";
  print(myHome);

  // 2. dynamic 선언변수
  // -> var와 유사하게 다양한 데이터형 할당가능함
  // 단, 처음 할당형과 다른 형을 넣어도 ok
  dynamic myId = "hhh1234";
  print("나의 아이디는 $myId");
  myId = 787878;
  print("나의 아이디는 $myId");

  // [ 문자형안에 변수 출력법 : '${코드}' '$변수' ]

  // [ 다트언어의 데이터 형 ]
  // 다트언어는 CS언어이기 때문에 변수형 선언이 기본이다

  // 1. 숫자형 :
  // int - 정수 / double - 실수 / num - 정수/실수
  int number1 = 2024;
  // 재할당가능한가?
  number1 = 6345;
  print('정수형$number1');

  double number2 = 3;
  number2 = 5.213;
  print('실수형$number2');

  // 정수/실수를 모두 포괄하는 형은? num
  num number3 = 100;
  number3 = 2.44;
  print("숫자$number3");

  // 2. 문자형 : String
  String name = "톰 행크스";
  print("나의 이름은$name입니다");
  // 3. 불린형 : bool
  bool isTrue = true;
  print("진짜인가$isTrue");

  /* 
  [제네릭(Generic) 이란]
  List 나 Set또는 Map 집합데이터형을 지정할 때 내부 데이터형을 정해주는 방법
  일반화하다라는 단어 General과 같은 계열의 단어인 Generic을 사용하여 부른다
  List<제네릭형> / Set<제네릭형> / Map<제네릭>
  > 참고 https://dart-ko.dev/language/generics
   */

  // 4. 콜렉션 : 묶음데이터
  // List / Set / Map
  // 4-1. List 형
  // 만약 다양한 형으로 사용할 경우엔 dynamic형을 사용함
  List<String> we = ['너', '나', '우리'];
  // var we = <String>['너','나','우리'] 와 같이 사용가능;
  List<dynamic> we2 = ['너', '나', '우리', 3];

  we.addAll(["형", "동생", "누나", "언니"]);
  we.add("형수");
  // we.add(88); 다른형은 에러남
  print(we);

  print(we[2] + "우리는 모두 친구");
  print("리스트개수:" + we.length.toString());
  print("리스트개수:" + we2.length.toString());
  // 일반 더하기로 문자형에 숫자를 더하면 에러남!
  // 왜? 문자형과 숫자형은 더할 수 없으니까
  // 숫자형을 문자형으로 형변환해야함

  // 4-2. Set형 : 중복없는 배열과 유사 그러나 중괄호 사용
  // -> 순서가 없고 중복되지않는 데이터 집합
  // -> 순서가 없으므로 호출해서 사용하고자 할떄는 List형으로 변환 후 사용한다
  // -> Set형변수.toList()
  Set<int> evens = {2, 4, 6, 8, 12, 14, 8};
  print("짝수Set:$evens");
  // 리스트형으로 형변환
  print("짝수Set을List로 변환후:${evens.toList()}");
  // 리스트로 변환 후 순번으로 출력가능
  print("짝수Set을List로 변환후:${evens.toList()[4]}");

  // 4-3. Map 형 : 데이터에 라벨링된 데이터 집합(JS객체와 유사)
  // 표시 : {속성:값, 속성:값}
  Map<String, String> actor = {"이름": "강동원", "나이": "41"};

  print("배우이름은:${actor["이름"]}이고 나이는${actor["나이"]}살 입니다");

  // List 내부 데이터인 Map형의 제네릭이 없으면 자동으로 dynamic으로 설정됨
  List<Map> actorData = [
    {"이름": "강동원", "나이": 41},
    {"이름": "박서방", "나이": "28"}
  ];

  print("두번째 인물의 이름은 ${actorData[1]["이름"]}이고 나이는 ${actorData[1]["나이"]}살이다");

  // [ 다트의 형변환 (Casting) ]
  // -> 특정 데이터형에서 다른 형으로 변환하는것을
  // 흔히 캐스팅이라고도 함!

  // 1. 일반적인 형변환 : 변수형.parse(대상변수)
  // 2. 메서드 체인방식 : 변수.to형()
  // -> 변수.toString() -> 문자형변환
  // -> 변수.toList() -> 컬랙션 List형변환

  String stNum = "777";
  print("문자형 숫자: $stNum");

  // 문자형 숫자를 캐스팅하여 숫자로 변환하여 계산
  num result = 111 + int.parse(stNum);
  print("111 + 777 = $result");
  // 주의: 형변환이 안될것 같으면 변환하지 마라!
  // -> 예컨데 문자형 문자를 숫자로 변경못함!
} // main 메서드 /////
