## 기기별 레이아웃 대응 

- Flutter에서 다양한 기기 (웹, 태블릿, 모바일) 환경에 맞는 UI를 구성하는 방법에 대해 학습하였다. 
- `LayoutBuilder`와 `ScreenLayoutBuilder`를 활용하여 화면 크기에 따라 다르게 동작하는 레이아웃을 정의

### 대응 방법

- `LayoutBuilder` 위젯을 사용하여 화면의 가로 너비 (`maxWidth`)를 기준으로 웹, 태블릿, 모바일을 구분하였다.
- **웹**: 화면 너비가 `_tabletWidth`를 초과하는 경우
- **태블릿**: 화면 너비가 `_mobileWidth`를 초과하고 `_tabletWidth` 이하인 경우
- **모바일**: 화면 너비가 `_mobileWidth` 이하인 경우
- 이러한 판별 결과를 `ScreenModel` 객체에 저장하고, `myBuilder` 함수를 통해 적절한 레이아웃을 빌드하도록 하였다.

<br/>

### LayoutBuilder에 대한 이해

- `LayoutBuilder`는 Flutter에서 부모 위젯의 제약 조건을 기준으로 하위 위젯을 빌드하는데 사용된다. 이를 통해 화면의 크기나 가로 너비에 따라 다른 UI를 적용할 수 있다. 
- `LayoutBuilder`의 `builder` 함수는 `BuildContext`와 부모 위젯의 제약 조건 (`BoxConstraints`)을 제공하며, 화면 크기에 맞는 레이아웃을 선택할 수 있다.
- 특히 `LayoutBuilder`는 실시간으로 화면 크기의 변화를 감지하고 이에 반응하여 UI를 다시 빌드할 수 있다. 
- 예를 들어, 사용자가 웹 브라우저의 크기를 조정하면 `LayoutBuilder`는 해당 변화를 인지하고 `builder` 함수를 다시 호출하여 적절한 레이아웃을 적용한다. 
- 이렇게 동적으로 반응하는 특성 덕분에 다양한 화면 크기에 맞춘 레이아웃을 구현할 수 있다.
- `ScreenLayoutBuilder`에서는 `LayoutBuilder`를 사용하여 화면 너비를 기준으로 웹, 태블릿, 모바일을 구분하였으며, 각 조건에 맞는 UI를 제공하기 위해 `ScreenModel` 객체를 사용하였다.

<br/>

### 코드 활용 방법


```dart
ScreenLayoutBuilder(
  myBuilder: (screenModel, web, tablet, mobile) {
    if (web) {
      return WebLayout();
    } else if (tablet) {
      return TabletLayout();
    } else {
      return MobileLayout();
    }
  },
);
```
- 해당 코드를 사용하면 Flutter에서 다양한 기기별 레이아웃을 간편하게 처리할 수 있다.
- `ScreenLayoutBuilder` 위젯에 원하는 레이아웃 빌더 함수를 전달하면, 화면 크기에 따라 동적으로 맞는 레이아웃을 적용할 수 있다.

<br/>

### MenuTabletAndMobile

- 기기별 대응으로 화면 너비가 줄어들 때 햄버거 메뉴를 보여주는 로직도 구현하였다.(`MenuTabletAndMobile` 클래스 사용)
- **햄버거 메뉴**: 화면 너비가 좁아질 경우 (`tablet` 또는 `mobile`) 햄버거 아이콘을 통해 메뉴를 열 수 있도록 `Scaffold`의 `openEndDrawer()` 메서드 사용
- **로고 크기 조절**: 태블릿과 모바일 환경에 따라 로고의 크기를 조절하여 화면 크기에 맞는 UI 구현

```dart
MenuTabletAndMobile(
  currentIndex: currentIndex,
  tablet: isTablet,
);
```
<br/>


### 학습한 내용 정리

- `LayoutBuilder`는 화면의 크기를 기준으로 조건을 설정할 때 유용하다.
- `LayoutBuilder`는 실시간으로 화면 크기 변화에 반응하여 적절한 UI를 다시 빌드한다.
- `ScreenLayoutBuilder`를 통해 화면 크기에 따라 웹, 태블릿, 모바일을 구분하고 각기 다른 UI를 적용할 수 있다.
- `MenuTabletAndMobile`을 사용하여 태블릿과 모바일 환경에서 햄버거 메뉴를 구현할 수 있다.
