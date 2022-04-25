# mentortee

너는내멘토티

루키

다온

케미

미뉴 미뉴

## 목차 <a name="toc"></a>

- [mentortee](#mentortee)
  * [목차](#toc)
  * [프로젝트 구조](#project-structure)
    + [디렉터리 구조](#directory-structure)
    + [View 종속 구조](#view-dependency-structure)
  * [Swift Code Convention](#swift-code-convention)
    + [1. 네이밍](#1-naming)
      - [1.1. 공통](#1-1-common)
      - [1.2. 변수 / 상수](#1-2-variable)
      - [1.3. 함수](#1-3-function)
      - [1.4. class / struct / enum](#1-4-class-struct-enum)
      - [1.5. 기타](#1-5-etc)
    + [2. 코드 포매팅](#2-code-formatting)
      - [2.1. import](#2-1-import)
      - [2.2. 빈 줄](#2-2-blank-line)
      - [2.3. 들여쓰기](#2-3-indent)
      - [2.4. 띄어쓰기](#2-4-spacing)
      - [2.5. 기타](#2-5-etc)
    + [3. 코드 스타일](#3-code-style)
      - [3.1. 클로저](#3-1-closure)
      - [3.2. struct / class](#3-2-struct-class)
      - [3.3. self](#3-3-self)
      - [3.4. 타입](#3-4-type)

## 프로젝트 구조 <a name="project-structure"></a>

### 디렉터리 구조 <a name="directory-structure"></a>

```powershell
mentortee
├── mentorteeApp.swift
├── ContentView.swift
└── Chemi & Rookie
    ├── MainPage.swift
    ├── TabView.swift
    └── TopBar.swift
```

### View 종속 구조 <a name="view-dependency-structure"></a>

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

[참고링크](https://jusung.github.io/Swift-Code-Convention/)

### 1. 네이밍 <a name="1-naming"></a>

#### 1.1. 공통 <a name="1-1-common"></a>

- 모든 이름에는 _(underscore)를 사용하지 않는다
- 모든 이름에는 -(hypen)을 사용하지 않는다
- 의미없는 이름(i, j, k, a, b ...)은 사용하지 않는다
- 이름에는 복수형을 사용하지 않는다
- 이름에 get, set을 포함하지 않는다

#### 1.2. 변수 / 상수 <a name="1-2-variable"></a>

- camelCase를 사용한다

- 명사를 사용한다

- 버튼 등을 표시하는 객체는 Hungarian Notation으로 표기하며, 가독성을 위해 접두의 약어는 모두 소문자로 표시한다

  ex) `btnSave`

- Hungarian Notation의 약어는 약속된 축약어만 사용하도록 한다

  - button -> `btn`
  - count -> `cnt`
  - boolean -> `b`

- `static` 변수의 이름 앞에는 접두로 `k`를 붙인다

- `bool` 타입의 변수는 접두로 `is` 혹은 `b`를 사용한다

#### 1.3. 함수 <a name="1-3-function"></a>

- camelCase를 사용한다
- '동사 + 명사형'으로 사용한다
- 액션함수의 경우 '주어 + 동사 + 목적어' 형태로 작성한다
  - `will`: 특정 행위가 일어나기 직전을 의미
  - `did`: 특정 행위가 일어난 직후를 의미

#### 1.4. class / struct / enum <a name="1-4-class-struct-enum"></a>

- 클래스(타입, 프로토콜 포함) 이름에는 PascalCase(UpperCamelCase)를 사용한다
- enum의 case에는 모두 소문자를 사용한다

```swift
class SpaceFleet: SpaceThing { }

enum Result {
  case success
  case failure
}
```

#### 1.5. 기타 <a name="1-5-etc"></a>

- 리소스 파일(asset 등)은 모두 소문자를 사용한다
- 패키지 이름은 PascalCase(UpperCamelCase)를 사용한다



### 2. 코드 포매팅 <a name="2-code-formatting"></a>

#### 2.1. import <a name="2-1-import"></a>

- import하는 모듈은 알파벳 순으로 정렬한다
- 모듈은 파일이 필요로하는 최소한의 모듈만 import한다

#### 2.2. 빈 줄 <a name="2-2-blank-line"></a>

- 빈 줄에는 공백이 포함되지 않도록 한다
- 모든 파일은 빈 줄로 끝나도록 한다

#### 2.3. 들여쓰기 <a name="2-3-indent"></a>

- `Tab`은  `Space` 4칸으로 한다
- 들여쓰기는 Xcode에서 제공하는 `^` + `i` 단축키를 눌렀을 때, 적용되는 `space`를 사용한다
- 최대 가로 길이는 100 characters로 한다

#### 2.4. 띄어쓰기 <a name="2-4-spacing"></a>

- `:`(colon)을 사용할 때는 오른쪽에만 공백을 준다
  - 단, 삼항연산자에서는 양쪽에 공백을 준다

#### 2.5. 기타 <a name="2-5-etc"></a>

- `if let`, `guard let` 구문이 긴 경우에는 줄바꿈하고 한 칸 들여쓴다

- 불필요한 괄호는 생략한다
- button 형식은 아래와 같이 사용한다

```swift
Button(action: {
  saveAnswer()
  presentation.wrappedValue.dismiss()
}, label: {
  Text("작성완료:)").bold()
  	.frame(width: 310, height: 40, alignment: .center)
})
```



### 3. 코드 스타일 <a name="3-code-style"></a>

#### 3.1. 클로저 <a name="3-1-closure"></a>

- 파라미터와 리턴 타입이 없는 클로저 정의시 `() -> Void`를 사용한다

#### 3.2. struct / class <a name="3-2-struct-class"></a>

- 구조체를 생성할 때는 구조체 생성자를 사용한다

#### 3.3. self <a name="3-3-self"></a>

- 문법의 모호함을 제거하기 위해 언어에서 필수로 요구하지 않는 이상 `self`는 사용하지 않는다

#### 3.4. 타입 <a name="3-4-type"></a>

- `Array<T>`와 `Dictionary<T: U>` 등 보다는 `[T]`, `[T: U]`를 사용한다

