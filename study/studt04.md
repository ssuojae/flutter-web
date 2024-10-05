## Flutter Drawer 위젯 학습 및 적용 

### Drawer 위젯

- `Drawer` 위젯은 Flutter에서 화면의 측면에서 슬라이드로 나타나는 네비게이션 메뉴를 구현할 때 사용한다. 
- 모바일 애플리케이션에서 사용자가 쉽게 네비게이션할 수 있도록 도와준다. 일반적으로 앱바(AppBar)와 함께 사용되어 햄버거 아이콘을 누르면 `Drawer`가 화면에 나타나도록 설정한다.
- `Scaffold` 위젯의 `drawer` 속성에 `Drawer` 위젯을 전달함으로써 화면의 왼쪽에서 슬라이드하는 메뉴를 구현한다.
- `Drawer`는 주로 리스트 형태로 여러 메뉴 항목을 구성하며, 각 항목을 선택하면 특정 화면으로 이동하거나 기능을 수행할 수 있다.

### 주요 구성 요소

1. **Scaffold와 Drawer의 관계**: `Drawer` 위젯은 `Scaffold`의 `drawer` 또는 `endDrawer` 속성에 설정하여 사용할 수 있다. `drawer`는 왼쪽에서 나타나며, `endDrawer`는 오른쪽에서 나타난다.
2. **InkWell과 GestureDetector**: `Drawer` 내에서 항목들을 클릭 가능하게 하기 위해 주로 `InkWell`이나 `GestureDetector`를 사용한다. `InkWell`은 물결 효과를 준다는 차이가 있음.
3. **DrawerController**: `Drawer`는 `Scaffold.of(context)`를 통해 열고 닫을 수 있다. 이를 통해 특정 이벤트에서 `Drawer`를 열거나 닫는 동작을 제어할 수 있다.

### Drawer 위젯 사용 시 알아야 할 개념

1. **Stateful vs Stateless**: `Drawer`는 일반적으로 상태 변화를 트리거할 수 있으므로, 상태를 관리하는 `StatefulWidget`에서 사용하는 것이 좋다. 사용자가 메뉴를 선택할 때 상태 변경을 반영해야 하기 때문이다.
2. **화면 크기 대응**: `Drawer`의 너비는 화면 크기에 따라 조절될 필요가 있다. `LayoutBuilder` 또는 `MediaQuery`를 이용해 `tablet`, `mobile` 등 화면 타입에 따라 `Drawer`의 너비를 설정할 수 있다.
3. **GlobalKey 활용**: `Scaffold`와 `Drawer` 간 상호작용을 더 쉽게 하기 위해 `GlobalKey<ScaffoldState>`를 활용할 수 있다. 이를 통해 프로그램적으로 `Drawer`를 열거나 닫을 수 있다.

### 코드 예시

```dart
final class PageDrawer extends StatelessWidget {
  const PageDrawer({required this.currentIndex, required this.tablet, super.key});

  final int currentIndex;
  final bool tablet;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: tablet ? 280 : 230,
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Scaffold.of(context).closeEndDrawer();
              },
              customBorder: const CircleBorder(),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Icon(
                  Icons.close,
                  size: 20,
                ),
              ),
            ),
          ),
          // 메뉴 항목 리스트
        ],
      ),
    );
  }
}
```

### Drawer 사용 시 고려할 점

1. **사용자 경험**: 사용자가 쉽게 열고 닫을 수 있어야 하며, 닫기 버튼이나 `Scaffold.of(context).closeEndDrawer()`와 같은 방법을 제공해 쉽게 닫을 수 있도록 해야 한다.
2. **접근성**: 화면 판독기 등 접근성 도구를 사용하는 사용자를 위해 `Drawer`의 각 항목에 적절한 레이블을 제공해야 한다.
3. **애니메이션 효과**: `Drawer`는 기본적으로 애니메이션을 포함해 나타나지만, 커스텀 애니메이션을 추가해 더 나은 경험을 제공할 수 있다.
