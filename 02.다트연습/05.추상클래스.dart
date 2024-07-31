/****************************************** 
 [다트 추상클래스]
 -> 형식을 강제할때 사용하는 클래스 생성방법
 -> 일반 상속과 달리 추상클래스는 모든 속성과
 메서드를 다 구현해야함!
 * 사용법:
 * abstract 키워드로 클래스를 선언한다->추상클래스
 * abstract는 추상화한...라는 뜻
 * 
  abstract class 추상클래스명{
    구현부
  }
 
 * 추상클래스를 상속 받는 것처럼 연결하는 방법은
 * implements 키워드로 연결한다!
 * implement는 시행하다...라는 뜻!
 * -> 추상클래스에 정의된 모든 속성과 메서드를 구현해야함!
 
 class 클래스명 implements 추상클래스명 {
    구현부
 }
******************************************/

// 추상클래스 연습 : 사람클래스를 추상클래스로 만들기
// -> 특정인물 클래스에서 사람클래스를 받아서 구현함!

abstract class Saram {
  // 생성자
  Saram(this.name);

  // 속성과 메서드 설계하기
  // ->>> 추상클래스 메서드는
  // 구체적으로 구현하지 않는다! -> 해당클래스에서 구현
  // -> 그러나 대체적인 틀을 잡을 수 있음

  // 1. 이름속성
  final String name;
  // 2. 성별메서드
  String gender();
  // 3. 나이메서드
  String age();
  // 4. 먹다메서드 : 내용틀잡기
  String eat() => '$name씨는 지금 아무것도 안먹는다!';
  // 람다식 앞에 함수일 경우 Function키워드가 없다!

  // 5. 말하다메서드 : 내용틀잡기
  String say() => '$name씨는 지금 아무말도 안한다!';
}

// 추상클래스를 상속(implements)받아 사용하기!
// -> 오버라이드 필수!(재정의를 반드시 해야함!)
// 도경수 배우의 클래스
class KyungSu implements Saram {
  @override
  late String _name; // 셋팅변수
  String get name => _name;
  set name(String name) => _name = name;

  // String get name => '도경수';
  // get 키워드는 겟터를 사용하는 변수를 선언함

  @override
  String gender() => '$name씨는 남자다!';

  @override
  String age() => '$name씨의 나이는 30살이다!';

  @override
  String eat() {
    return '$name씨는 피자를 먹는다!';
  }
  // String eat() => '$name씨는 피자를 먹는다!';

  @override
  String say() => '$name씨는 무엇인가 말하고 있다!';
} //////////// KyungSu 클래스 /////////////

/************************************************* 
 * [ 다트의 오버라이드(override) ]
 * - 기존의 정의된 속성과 메서드를 재정의 하는 것이다!
 * (그래서 위에 올라탄다는 단어를 쓰는 것임!)
 * -> 오버라이드 할때 어노테이션(주석)을 써준다!
 * @override : 오버라이드 표시역할 및 처리도움!
 * 
 * 참고: 다트에는 오버로드(overload)가 없다!
 * - 오버로드는 같은 이름의 메서드의 파라미터만 그 개수가
 * 다르게 여러게 만들수 있는 것으로 말함!

*************************************************/

/*************************************** 
[ 다트의 겟터 / 셋터 ]
변수값 읽기와 할당을 하도록 캡슐화를 하여
값 셋팅시 정보를 은닉하여 변수를 관리하는 방법

((방법:))
late 변수형 셋팅변수명;
변수형 get 변수명 => 셋팅변수명;
set 변수명(변수형 변수명) -> 셋팅변수명 = 변수명

((겟터/셋터 변수명))
일반적으로 변수명과 셋팅변수명은 같은이름이며 
셋팅변수명 앞에 언더바(_)를 붙여구분함
예) 변수명-> name, 셋팅변수명->_name

((late 키워드))
선언한 변수가 바로 할당되지 못할 경우
late 키워드를 앞에 사용하여 사용직전에
할당될 것임일 알려주면 에러를 막을 수 있다!

((겟터/셋터 값할당))
-> 외부에서 인스턴스 생성후 셋터를 통해 
값을 셋팅할 경우 변수명에 할당하면 된다!
클래스.변수명 = 값

 ***************************************/

/// 남지현 배우 클래스 : Saram 클래스  일반 상속하기
/// 일반상속은 부모클래스의 모든 내용을 재정의할 필요없음!
/// -> 단, 구체적인 정의가 없는 메서드는 필수재정의!!!
class JeeHyun extends Saram {
  // 생성자 : 받은 값을 부모클래스로 넘겨 먼저셋팅함!
  JeeHyun(String name) : super(name);

  @override
  String gender() => '$name씨는 여자다!';

  @override
  String age() => '$name씨는 28살이다!';
} ////////// JeeHyun 클래스 ///////////

// 일반적인 남자를 나타내는 클래스 /////////
// 추상클래스임! -> 추상클래스를 일반상속한 추상클래스임!
abstract class Namja extends Saram {
  // 생성자
  Namja(String name) : super(name);

  // 필수재정의는 없고 원하는 것을 재정의함!
  @override
  String gender() => '$name씨는 남자다!';
} //////////// Namja 추상클래스 /////////////

// 일반적인 여자를 나타내는 클래스 /////////
// 추상클래스임! -> 추상클래스를 일반상속한 추상클래스임!
abstract class Yeoja extends Saram {
  // 생성자
  Yeoja(String name) : super(name);

  // 필수재정의는 없고 원하는 것을 재정의함!
  @override
  String gender() => '$name씨는 여자다!';
} //////////// Yeoja 추상클래스 /////////////

/////// 박서준 배우의 클래스 /////////////
/// 남자 추상클래스를 상속받는다!
/// 추상클래스를 일반상속한 클래스는 추상클래스의 미정의 메서드를
/// 필수정의 해야하는데 gender() 메서드는 상속받은
/// 추상클래스인 Namja에서 이미 재정의 했으므로
/// Saram 추상클래스에 남은 재정의 메서드 항목은 age만 남는다!
class SeoJun extends Namja {
  SeoJun(String name) : super(name);

  // 필수재정의 항목 : age()
  String age() => '$name씨는 39살이다!';

  // 내가 추가로 하고 싶은 재정의하기
  String eat() => '$name씨는 햄버거를 먹는다!';
} ///////// SeoJun 클래스 ///////////////

/// 다중상속 믹스인 활용을 위한 클래스 만들기 /////
/// 취미에 대한 메서드를 구현한 Hobby 믹스인 만들기
/// class 키워드 없으면 단순 결합 클래스임(생성자없음!)
mixin Hobby {
  // 요리하다메서드
  String cook() => '씨는 지금 요리한다!';
  // 책읽다메서드
  String read() => '씨는 지금 책을 읽는다!';
} //////// Hobby 믹스인 클래스 ////////

// 가수 믹스인 만들기 /////////
// 믹스인에 on 키워드를 사용하면 특정클래스를 상속받은 경우
// 에만 다중상속을 하도록 제한할 수 있다!
// on Namja 라는 것은 남자클래스를 상속한 경우만 믹스인사용!
// -> 결과적으로 남자가수에만 사용가능!
mixin Singer on Namja {
  String sing() => '씨는 지금 노래한다!';
} //////// Singer 믹스인 클래스 /////////

///// 믹스인을 사용하는 이준호 배우겸 가수의 클래스 만들기///
class JunHo extends Namja with Hobby, Singer {
  // 생성자
  JunHo(String name) : super(name);

  // 필수재정의 메서드 : age()
  @override
  String age() => '$name씨는 33살이다!';

  // 선택적 재정의 : cook() -> Hobby 믹스인 클래스 메서드
  @override
  String cook() => '$name${super.cook()}';
  // Hobby 클래스의 cook() 메서드는 이름이 없으므로
  // 이름을 넣고 출력하기 위해 이 메서드를 호출하려고 함
  // 이때 부모를 지칭하는 super 키워드를 쓰면 된다!
  // super.cook()

// 선택적 재정의 : sing() -> Singer 믹스인 클래스 메서드
  @override
  String sing() => '$name${super.sing()}';
  // 믹스인 Singer 도 부모이므로 super 키워드에 잡힌다!
  // 이름과 메시지를 합쳐서 리턴함!
} /////////////// JunHo 클래스 ///////////////

//// 테스트를 수행하는 함수 /////
void testClass() {
  // 추상클래스를 구현한 경수클래스 인스턴스생성
  KyungSu ks = KyungSu();
  ks.name = '도경수';
  print(ks.eat());
  print(ks.say());
  print(ks.gender());
  print('\n');
  // print(KyungSu().eat());
  // print(KyungSu().say());

  // 추상클래스를 일반 상속받은
  // 지현클래스 인스턴스 생성
  JeeHyun jh = JeeHyun('남지현');
  print(jh.age());
  print(jh.gender());
  print(jh.eat());
  // 재정의 안한 메서드는
  // Saram의 원본 메서드가 출력됨!
  print('\n');

  // 추상클래스의 추상클래스를 상속한
  // 서준클래스 인스턴스 생성
  SeoJun sj = SeoJun('박서준');
  print(sj.age());
  print(sj.eat());
  print('\n');

  // 추상클래스와 여러 믹스인 클래스를 상속받은 준호클래스
  // 인스턴스 생성하기
  JunHo jho = JunHo('이준호');
  print(jho.gender());
  print(jho.age());
  print(jho.cook());
  print(jho.sing());
} ////// testClass /////////////

// 메인 함수 //
void main() {
  // 테스트 함수 호출
  testClass();
} /// main ///