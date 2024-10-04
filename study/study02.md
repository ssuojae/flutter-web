## Flutter에서 TextTheme으로 폰트 관리하기

- Flutter에서 **`TextTheme`**은 다양한 텍스트 스타일을 **일관되게 관리**할 수 있는 도구이다. 
- 제목, 본문, 버튼 텍스트 등에 각각 다른 스타일을 적용해야 하지만, 이 작업을 반복적으로 하다 보면 코드가 길어지고 관리가 어려워질 수 있다. 
- 이를 해결하기 위해 **TextTheme**을 사용하면 효율적이다.

<br/>

### TextTheme이란?

- **`TextTheme`**은 Flutter에서 **Material Design**을 따르는 **텍스트 스타일 모음**이다. 
- 텍스트 스타일을 한 곳에서 관리하고, 필요할 때마다 스타일을 일관되게 적용할 수 있다. 이를 통해 **앱 전체에서 일관된 디자인**을 유지할 수 있다.

<br/>

### TextTheme의 주요 구성 요소

- **`TextTheme`**에는 여러 가지 기본 텍스트 스타일이 포함되어 있으며, 각 상황에 맞는 스타일을 제공한다.
- **headlineLarge**: 큰 제목에 사용된다.
- **bodyLarge**: 본문 텍스트에 사용된다.
- **labelLarge**: 레이블이나 버튼에 사용된다.
- 이런 스타일들은 모두 확장하거나 수정할 수 있다.

<br/>

### TextTheme 사용 방법

- Flutter에서 **`TextTheme`**을 사용하려면, 우선 폰트 파일을 추가하고 `pubspec.yaml`에 설정한 후, `TextTheme`을 활용하여 다양한 텍스트 스타일을 정의할 수 있다. 
- 아래는 코드 예시이다.

```dart
final class TextUtil {
  static TextTheme setTextTheme() {
    return const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'NotoSans', // 큰 제목에 적용할 폰트
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'NotoSans', // 본문에 적용할 폰트
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        fontFamily: 'NotoSans', // 레이블이나 버튼에 적용할 폰트
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
    );
  }
}
```

- 위 코드에서 headlineLarge, bodyLarge, **labelLarge**는 각각의 텍스트 스타일을 정의하는 부분이다.
- 이를 통해 앱 전체에서 일관된 텍스트 스타일을 쉽게 적용할 수 있다.

<br/>

### ThemeData에 적용하기

```dart
ThemeData theme = ThemeData(
  textTheme: TextUtil.setTextTheme(),
);
```
- 정의한 **TextTheme**을 **ThemeData**에 적용하여 앱 전체에서 사용할 수 있다.
- 이렇게 설정하면 앱 전체에 동일한 폰트 스타일을 적용할 수 있고, 나중에 디자인이 변경되어도 쉽게 수정할 수 있다.
- Flutter에서 **TextTheme**은 앱의 일관된 디자인을 유지하면서도 유연하게 텍스트 스타일을 관리할 수 있는 방법이다.
- 앱의 모든 텍스트에 일관된 스타일을 적용하려면 **TextTheme**을 설정하고, 이를 **ThemeData**에 적용하는 것이 좋다.