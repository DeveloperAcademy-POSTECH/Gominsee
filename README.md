# mentortee
너는내멘토티

루키

다온

케미

미뉴 미뉴

## 목차

- [mentortee](#mentortee)

  - [목차](##목차)
  - [프로젝트 구조](##프로젝트-구조)
  - [Swift Code convention](##Swift-Code-Convention)

    - [1. 코드 포매팅](###1-코드-포매팅)

      - [1.1. import](####1.1.-import)

      - [1.2. 빈줄](####1.2.-빈줄)

      - [1.3. 들여쓰기](####1.3.-들여쓰기)

      - [1.4. 띄어쓰기](####1.4.-띄어쓰기)

      - [1.5. 기타](####1.5.-기타)

    - [2. 네이밍](###2.-네이밍)

      - [2.1. 일반](####2.1.-일반)

      - [2.2. 클래스](####2.2.-클래스)

      - [2.3. 함수](####2.3.-함수)

      - [2.4. 약어](####2.4.-약어)

    - [3. 코드 스타일 (기타)](#3.-코드-스타일-(기타))

      - [3.1. 클로저](####3.1.-클로저)

      - [3.2. 클래스와 구조체](####3.2.-클래스와-구조체)

      - [3.3. 타입](####3.3.-타입)

      - [3.4. 타입추론 사용](####3.4.-타입추론-사용)

      - [3.5. self](####3.5.-self)

      - [3.6. 튜플](####3.6.-튜플)

      - [3.7. 패턴](####3.7.-패턴)

      - [3.8. 제네릭](####3.8.-제네릭)

      - [3.9. static](####3.9.-static)

      - [3.10. final](####3.10.-final)

      - [3.11. 프로토콜 extension](####3.11.-프로토콜-extension)

      - [3.12. switch-case](####3.12.-switch-case)

      - [3.13. return](####3.13.-return)

      - [3.14. 사용하지 않는 코드](####3.14.-사용하지-않는-코드)

## 프로젝트 구조

### 디렉터리 구조

```powershell
mentortee
├── mentorteeApp.swift
├── ContentView.swift
└── Chemi & Rookie
    ├── MainPage.swift
    ├── TabView.swift
    └── TopBar.swift
```

### View 종속 구조

```powershell
mentortee
├── mentorteeApp.swift
└── ContentView.swift
│   ├── MainPage.swift
│   ├── Feed페이지
│   ├── 내가한질문/답변
│   └── 마이페이지
└── 리소스
```



## Swift Code Convention

[원문링크](https://jusung.github.io/Swift-Code-Convention/)

### 1. 코드 포매팅

#### 1.1. import

- 모듈 import는 알파벳 순 정렬
- 내장 프레임워크를 먼저 import하고, 빈 줄로 구분해 써드파티 프레임워크 import

```swift
import UIKit

import SwiftyColor
import SwiftyImage
import Then
import URLNavigator
```

- 파일이 필요로하는 최소의 모듈만 import

  ex) `Foundation`으로 충분하면 `UIKit`은 import 하지 않음

✅ Preferred

```swift
import UIKit

var view: UIView
var deviceModels: [String]
```

✅ Preferred

```swift
import Foundation

var deviceModels: [String]
```

⛔️ Not Preferred

```swift
import UIKit
import Foundation

var view: UIView
var deviceModels: [String]
// UIKit의 요소만 들어갔으므로 Foundation은 필요없음
```

⛔️ Not Preferred

```swift
import UIKit
var deviceModels: [String]
```

- 모델의 상세까지 지정할 수 있으면 지정

✅ Preferred

```swift
import struct SwiftyJSON.JSON
import struct CoreLocation.CLLocation.CLLocationCoordinate2D
```

⛔️ Not Preferred

```swift
import SwiftyJSON
import CoreLocation
```



#### 1.2. 빈 줄

- 빈 줄에는 공백이 포함되지 않도록 함
- 모든 파일은 빈 줄로 끝나도록 함



#### 1.3. 들여쓰기

- 탭을 눌렀을시 4개의 `space` 사용
- 들여쓰기는 Xcode에서 제공하는 `^` + `i`를 눌렀을 때, 적용되는 space 사용
- 최대 가로 길이는 100 characters 사용



#### 1.4. 띄어쓰기

- `:`(콜론)을 사용할 때는 콜론의 오른쪽에만 공백을 둠

[상수]

✅ Preferred

```swift
let names: [String: String]?
```

⛔️ Not Preferred

```swift
let names: [String:String]?
let names: [String : String]?
```

[클래스]

✅ Preferred

```swift
class MyClass: SuperClass {
  // ...
}
```

⛔️ Not Preferred

```swift
class MyClass : SuperClass {
  // ...
}
```

- 삼항연산자의 경우 콜론 앞뒤로 띄움

✅ Preferred

```swift
func application (_ application: UIApplication, supportedInterfaceOrientationFor window: UIWindow?) -> UIInterfaceOrientationMask {
  return shouldRotate ? .allButUpsideDown : .protrait
}
```

⛔️ Not Preferred

```swift
func application (_ application: UIApplication, supportedInterfaceOrientationFor window: UIWindow?) -> UIInterfaceOrientationMask {
  return shouldRotate ? .allButUpsideDown: .protrait
}
```

[기타]

✅ Preferred

```swift
// specifying type
let pirateViewController: PirateViewController

// dictionary syntax (note that we left-align as opposed to aligning colons)
let ninjaDictionary: [String: AnyObject] = [
  "fightLikeDairyFarmer": false,
  "disgusting": true
]

// declaring a function
func myFunction<T, U: SomeProtocol>(firstArgument: U, secondArgument: T) where T.RelatedType == U {
  /* ... */
}

// calling a function
someFunction(someArgument: "Kitten")

// superclasses
class PirateViewController: UIViewController {
  /* ... */
}

// protocols
extension PirateViewController: UITableViewDataSourcec {
  /* ... */
}
```

- `if let`, `guard let` 구문이 긴 경우, 줄바꿈하고 한 칸 들여씀

✅ Preferred

```swift
if let user = self.veryLongFunctionNameWhichReturnOptionalUser(),
 let name = user.veryLongFunctionNameWhichReturnsOptionalName(),
 user.gender == .female {
   // ...
}

guard let user = self.veryLongFunctionNameWhichReturnOptionalUser(),
 let name = user.veryLongFunctionNameWhichReturnsOptionalName(),
 user.gender == .female else {
   return
}
```

- 일반적으로 `,`(콤마) 뒤에 공백 추가

✅ Preferred

```swift
let myArray = [1, 2, 3, 4, 5]
```

⛔️ Not Preferred

```swift
let myArray = [1,2,3,4,5]
```

- 연산자 앞뒤로 공백 추가

✅ Preferred

```swift
let myValue =. 0 + (30 / 2) * 3
```

⛔️ Not Preferred

```swift
let myValue = 20+(30/2)*3
```

- 화살표 양쪽에 가독성을 위해 빈 공백 추가

[함수 리턴 타입]

✅ Preferred

```swift
func doSomething() -> String {
  // ...
}
```

⛔️ Not Preferred

```swift
func doSomething()->String {
  // ...
}
```

[클로저 리턴 타입]

✅ Preferred

```swift
func doSomething(completion: () -> Void) {
  // ...
}
```

⛔️ Not Preferred

```swift
func doSomething(completion: ()->Void) {
  // ...
}
```

[Rx]

✅ Preferred

```swift
.map { $0.call.farePaymentType }
.map { method -> String? in
     guard let name = method.name else { return nil }
     return Local.Taxi.taxiDispatchingPaidItemApply.string.phrase(["item_name": name])
}
```

⛔️ Not Preferred

```swift
.map {$0.call.farePaymentType}
.map {method -> String? in
     guard let name = method.name else { return nil }
     return Local.Taxi.taxiDispatchingPaidItemApply.string.phrase(["item_name": name])
}
```

✅ Preferred

```swift
var bizGroupHidden: Driver<Bool> {
  return self.callInfo.asObservable()
  	.map { $0.call.bizGroup }
  	.map { $0 == nil }
  	.asDriverJustComplete()
}
```

```swift
var bizGroupHidden:Driver<Bool> {
  return self.callInfo.asObservable()
  	.map { $0.call.bizGroup }
  	.map { $0 == nil }
  	.asDriverJustComplete()
}
```



#### 1.5. 기타

- 불필요한 괄호 생략

✅ Preferred

```swift
if userCount > 0 { ... }
switch someValue { ... }
let evens = userCounts.filter { number in number % 2 == 0 }
let squares = userCounts.map { $0 * $0 }
```

⛔️ Not Preferred

```swift
if (userCount > 0) { ... } // 다만 이 경우에는 괄호를 하는 것이 가독성면에서 더 좋을 수도 있습니다
switch (someValue) { ... } // 이 경우도 마찬가지에요
let evens = userCounts.filter { (number) in number % 2 == 0 }
let squares = userCounts.map() { $0 * $0 }
```

- `enum`의 연관값을 사용하지 않는 경우 생략

✅ Preferred

```swift
if case .done = result { ... }

switch animal {
  case .dog:
  	...
}
```

⛔️ Not Preferred

```swift
if case .done(_) = result { ... }

switch animal {
  case .dog(_, _, _):
  	...
}
```



### 2. 네이밍

- 묘사를 잘하고 일관된 네이밍은 코드를 읽고 이해하기 쉽게 해줌

- 네이밍은 Apple의 [API Design Guidelines](https://swift.org/documentation/api-design-guidelines)을 따름

- 클래스(타입, 프로토콜 이름 포함) 이름에는 UpperCamelCase(첫 문자를 대문자로 시작하는 camel 표기법) 사용

- 함수 이름에는 camelCase를 사용

- 변수 / 상수 이름은 camelCase 사용

- 객체를 가리키는 객체 이름은 Hungarian Notation으로 표기하며, 가독성을 위해 접두의 약어는 모두 소문자로 표기

  ex) let btnSave

- bool 타입 변수 이름은 이름 앞에 is 접두어 사용

  ex) let isAge: Bool

- 의미없는 이름 및 단일 글자(i, j, ab, cd 등) 사용 금지
  - for문이나 while문 등의 반복문 내부에서 반복을 처리하기 위한 임시적인 변수 이름으로는 단일 글자 사용이 가능하나, 이 경우도 되도록 지양
  - ~cnt 등의 이름으로 대체
- 이름에 복수형 표기금지

- 리소스 파일의 이름은 소문자로 표기
- 패키지의 이름은 camelCase로 표기

=> PascalCase(UpperCamelCase), camelCase(lowerCamelCase), UPPER_CASE, Hungarian Notation

#### 2.1. 일반

[일반]

✅ Preferred

```swift
protocol SpaceThing {
  // ...
}

class SpaceFleet: SpaceThing {
  
  enum Formation {
    // ...
  }
  
  class Spaceship {
    // ...
  }
  
  var ships: [Spaceship] = []
  static let worldName: String = "Earth"
  
  func addShip(_ ship: Spaceship) {
    // ...
  }
}

let myFleet = SpaceFleet()
```

[변수/상수]

- 일반변수 / 상수인 경우 따로 접두사를 붙이지 않음

✅ Preferred

```swift
let maximumNumberOfLines = 3
```

⛔️ Not Preferred

```swift
let kMaximumNumberOfLines = 3
let MAX_LINES = 3
```

- `static` 상수인 경우 앞에 k를 붙임

✅ Preferred

```swift
static let kMaximumNumberOfLines = 3
```

⛔️ Not Preferred

```swift
static let maximumNumberOfLines = 3
```

[열거형]

✅ Preferred

```swift
enum Result {
  case success
  case failure
}
```

⛔️ Not Preferred

```swift
enum Result {
  case Success
  case Failure
}
```

[RxSwift]

- RxSwift의 `Subject`, `Driver`, `ControlerProperty`, `ControlEvent` 등은 따로 접미사를 붙이지 않음

✅ Preferred

```swift
let recommendItem = BehaviorRelay<RecommendRidItem?>(value: nil)
let optionSwitch = PublishSubject<Void>()
let showRideSuggestion = PublishSubject<Void>()
```

⛔️ Not Preferred

```swift
let recommendItem = BehaviorRelay<RecommendRidItem?>(value: nil)
let optionSwitchSignal = PublishSubject<Void>()
let showRideSuggestionPS = PublishSubject<Void>()
```

- 일반적인 구문을 앞에두고 구체적인 부분을 뒤에 둠

✅ Preferred

```swift
let titleMarginRight: CGFloat
let titleMarginLeft: CGFLoat
let bodyMarginRight: CGFloat
let bodyMarginLeft: CGFLoat
```

⛔️ Not Preferred

```swift
let rightTitleMargin: CGFloat
let leftTitleMargin: CGFLoat
let bodyRightMargin: CGFloat
let bodyLeftMargin: CGFLoat
```

- 생략시 사용이 모호해지는 타입은 이름에 타입에 대한 힌트 포함

✅ Preferred

```swift
let titleText: String
let cancelButton: UIButton
```

⛔️ Not Preferred

```swift
let title: String
let cancel: UIButton
```



#### 2.2. 클래스

- 함수 이름에는 되도록 `get`을 붙이지 않음

✅ Preferred

```swift
func name(for user: User) -> String?
```

⛔️ Not Preferred

```swift
func getName(for user: User) -> String?
```



#### 2.3. 함수

- 액션 함수의 네이밍은 '부어 + 동사 + 목적어' 형태 사용
  - will은 특정 행위가 일어나기 직전이고, did는 특정 행위가 일어난 직후

✅ Preferred

```swift
func backButtonDidTap() {
  // ...
}
```

⛔️ Not Preferred

```swift
func back() {
  // ...
}

func pressBack() {
  // ...
}
```



#### 2.4. 약어

- 약어로 시작하는 경우 소문자로 표기하고, 그 외 경우에는 항상 대문자로 표기

[예1]

✅ Preferred

```swift
let userID: Int?
let html: String?
let websiteURL: URL?
let urlString: String?
```

⛔️ Not Preferred

```swift
let userId: Int?
let HTML: String?
let websiteUrl: NSURL?
let URLString: String?
```

[예2]

✅ Preferred

```swift
class URLValidator {
  
  func isValidURL(_ url: URL) -> Bool {
    // ...
  }
  
  func isProfileURL(_ url: URL, for userID: String) -> Bool {
    // ...
  }
}

let urlValidator = URLValidator()
let isProfile = urlValidator.isProfileUrl(urlToTest, userID: idOfUser)
```

⛔️ Not Preferred

```swift
class URLValidator {
  
  func isValidUrl(_ URL: URL) -> Bool {
    // ...
  }
  
  func isProfileUrl(_ URL: URL, for userID: String) -> Bool {
    // ...
  }
}

let URLValidator = UrlValidator()
let isProfile = URLValidator.isProfileUrl(URLToTest, userId: iDOfUser)
```



### 3. 코드 스타일 (기타)

#### 3.1. 클로저

- 파라미터와 리턴 타입이 없는 클로저 정의시 `() -> Void` 사용

✅ Preferred

```swift
let completionBlock: (() -> Void)?
```

⛔️ Not Preferred

```swift
let completionBlock: (() -> ())?
let completionBlock: ((Void) -> (Void))?
```

- 클로저 정의시 파라미터에는 괄호를 사용하지 않음

✅ Preferred

```swift
{ operation, responseObject in
 	// doSomething()
}
```

⛔️ Not Preferred

```swift
{ (operation, responseObject) in
 	// doSomething()
}
```

- 클로저 정의시 가능한 경우 타입 정의 생략

✅ Preferred

```swift
completion: { finished in
  // doSomething()
}
```

⛔️ Not Preferred

```swift
completion: { (finished: Bool) -> Void in
  // doSomething()
}
```

- 클로저 호출시 또 다른 유일한 클로저를 마지막 파라미터로 받는 경우, 파라미터 이름 생략

✅ Preferred

```swift
UIView.animate(withDuration: 0.5) {
  // doSomething()
}
```

⛔️ Not Preferred

```swift
UIView.animate(withDuration: 0.5, animations: { () -> Void in
	// doSomething()
})
```

- 사용하지 않는 파라미터는 `_`를 사용해 표시

✅ Preferred

```swift
someAsyncThing() { _, _, argument3 in
	print(argument3)
}
```

⛔️ Not Preferred

```swift
someAsyncThing() { argument1, argument2, argument3 in
	print(argument3)
}
```

- 한줄 클로저는 반드시 각 괄호 양쪽에 공백 추가

✅ Preferred

```swift
let evenSquares = numbers.filter { $0 % 2 == 0 }.map { $0 * $0 }
```

⛔️ Not Preferred

```swift
let evenSquares = numbers.filter {$0 % 2 == 0}.map {  $0 * $0  }
```



#### 3.2. 클래스와 구조체

- 구조체를 생성할 때는 Swift 구조체 생성자 사용

✅ Preferred

```swift
let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
```

⛔️ Not Preferred

```swift
let frame = CGRect(0, 0, 100, 100)
```



#### 3.3. 타입

- `Array<T>`와 `Dictionary<T: U>` 보다는 `[T]`, `[T: U]` 사용

✅ Preferred

```swift
var messages: [String]?
var names: [Int: String]?
```

⛔️ Not Preferred

```swift
var messages: Array<String>?
var names: Dictionary<Int, String>?
```



#### 3.4. 타입추론 사용

- 컴파일러가 문맥속에서 타입을 추론할 수 있으면 더 간결한 코드를 위해 타입 생략

✅ Preferred

```swift
let selector = #selector(viewDidLoad)
view.backgroundColor = .red
let toView = context.view(forKey: .to)
let view = UIView(frame: .zero)
```

⛔️ Not Preferred

```swift
let selector = #selector(ViewController.viewDidLoad)
view.backgroundColor = UIColor.red
let toView = context.view(forKey: UITransitionContextViewKey.to)
let view = UIView(frame: CGRect.zero)
```



#### 3.5. self

- 문법의 모호함을 제거하기 위해 언어에서 필수로 요구하지 않는 이상 `self` 금지

```swift
final class Listing {
  private let isFamilyFriendly: Bool
  private var capacity: Int
  
  init(capacity: Int, allowsPets: Bool) {
    ✅ Preferred
    self.capacity = capacity
    isFamilyFriendly = !allowsPets
    
    ⛔️ Not Preferred
    self.capacity = capacity
    self.isFamilyFriendly = !allowsPets
  }
  
  privaate func increaseCapacity(by amount: Int) {
    ✅ Preferred
    capacity += amount
    
    ⛔️ No Preferred
    self.capacity += amount
    
    ✅ Preferred
    save()
    
    ⛔️ Not Preferred
    self.save()
  }
}
```

✅ Preferred

```swift
TaxiPush.progressing.asPushActionObservable(callInfo.value.call.id)
	.map { $0.progressing }.unwrap()
	.map { $0/60 }
	.bind(to: timeRadius)
	.disposed(by: disposeBag)
```

⛔️ Not Preferred

```swift
TaxiPush.progressing.asPushActionObservable(callInfo.value.call.id)
	.map { $0.progressing }.unwrap()
	.map { $0/60 }
	.bind(to: self.timeRadius)
	.disposed(by: self.disposeBag)
```



#### 3.6. 튜플

- 튜플의 멤버에는 명확성을 위해 이름을 붙여줌
- 만약 필드가 3개를 넘는 경우 `struct` 사용을 고려해보는 것을 권장

✅ Preferred

```swift
func whatever() -> (x: Int, y: Int) {
  return (x: 4, y: 4)
}
```

⛔️ Not Preferred

```swift
func whatever() -> (Int, Int) {
  return (4, 4)
}
let thing = whatever()
print(thing.0)
```

✅ Okay

```swift
func whatever() -> (x: Int, y: Int) {
  let x = 4
  let y = 4
  return (x, y)
}

let coord = whatever()
coord.x
coord.y
```

✅ Preferred

```swift
.map{($0.coord, nil, false)}
.withLatestFrom(viewModel.swapController) { (mapInfo: $0, swapController: $1) }
.filter { guard case .search = $0.swapController else { return false }; return true }
.map{$0.0},
```

⛔️ Not Preferred

```swift
.map{($0.coord, nil, false)}
.withLatestFrom(viewModel.swapController) { ($0, $1) }
.filter { guard case .search = $0.1 else { return false }; return true }
.map{$0.0},
```



#### 3.7. 패턴

- 프로퍼티의 초기화는 가능하면 `init`에서하고 가능하면 unwrapped Optional 사용 지양

✅ Preferred

```swift
class MyClass: NSObject {
  
  init() {
    someValue = 0
    super.init()
  }
  
  var someValue: Int
}
```

⛔️ Not Preferred

```swift
class MyClass: NSObject {
  
  init() {
    super.init()
  }
  
  var someValue: Int?
}
```



#### 3.8. 제네릭

- 제네릭 타입 파라미터는 대문자를 사용하고 묘사적이어야 함
- 타입 이름이 의미있는 관계나 역할을 갖는 경우에만 `T`, `U` 혹은 `V` 같은 전형적인 단일 대문자를 사용하고, 그 외에는 의미있는 이름 사용

✅ Preferred

```swift
struct Stack<Element> { ... }
func write<Target: OutputStream>(to target: inout Target)
func swap<T>(_ a: inout T, _ b: inout T)
```

⛔️ Not Preferred

```swift
struct Stack<T> { ... }
func write<Target: OutputStream>(to target: inout Target)
func swap<Thing>(_ a: inout Thing, _ b: inout Thing)
```



#### 3.9. static

- 디폴트 타입 메소드는 `static` 사용

✅ Preferred

```swift
class Fruit {
  static func eatFruits(_ fruits: [Fruit]) { ... }
}
```

⛔️ Not Preferred

```swift
class Fruit {
  class func eatFruits(_ fruits: [Fruit]) { ... }
}
```



### static

#### 3.10. final

- 더 이상 상속이 발생하지 않는 클래스는 항상 `final` 키워드로 선언

✅ Preferred

```swift
final class SettingsRepository {
  // ...
}
```

⛔️ Not Preferred

```swift
class SettingsRepository {
  // ...
}
```



#### 3.11. 프로토콜 extension

- 프로토콜을 적용할 때는 extension을 만들어서 관련된 메서드를 모아둠

✅ Preferred

```swift
final class MyViewController: UIViewController {
  // ...
}

extension MyViewController: UITableViewDataSource {
  // ...
}

extension MyViewController: UITableViewDelegate {
  // ...
}
```

⛔️ Not Preferred

```swift
final class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  // ...
}
```



#### 3.12. switch-case

- `switch-case`에서 가능한 경우 `default`를 사용하지 않음
  - 새로운 `case`가 생성됐을 때, 인지하지 못한 상태에서 `default`로 처리되지 않고 의도적으로 처리를 지정해주기 위함

✅ Preferred

```swift
switch anEnum {
  case .a:
  	// Do something
  case .b, .c:
  	// Do Something else.
}
```

⛔️ Not Preferred

```swift
switch anEnum {
  case .a:
  	// Do something
  default:
  	// Do something else.
}
```



#### 3.13. return

- `return`은 생략하지 않음

✅ Preferred

```swift
["1", "2", "3"].compactMap { return Int($0) }

var size: CGSize {
  return CGSize(
  width: 100.0,
  heihgt: 100.0)
}

func makeInfoAlert(message: String) -> UIAlertController {
  return UIAlertController(
  title: "ℹ️ Info",
  message: message,
  preferredStyle: .alert)
}
```

⛔️ Not Preferred

```swift
["1", "2", "3"].compactMap { return Int($0) }

var size: CGSize {
  CGSize(
  width: 100.0,
  heihgt: 100.0)
}

func makeInfoAlert(message: String) -> UIAlertController {
  UIAlertController(
  title: "ℹ️ Info",
  message: message,
  preferredStyle: .alert)
}
```



#### 3.14. 사용하지 않는 코드

- Xcode가 자동으로 생성한 템플릿을 포함한 사용하지 않는 코드는 placeholder 코멘트를 포함해 모두 제거

✅ Preferred

```swift
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return Database.contacts.count
}
```

⛔️ Not Preferred

```swift
override func didReceiveMemoryWarning() {
  super.didReceiveMemoryWarning()
  // Dispose of any resources that can be recreated.
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  // #warning Incomplete implementation, return the number of rows
  return Database.contacts.count
}
```

