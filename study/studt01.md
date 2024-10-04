## 플러터 웹에서 Beamer 패키지를 사용한 이유

- Beamer는 Flutter에서 사용되는 **라우팅 패키지**이다. 
- Flutter 기본 라우터도 모바일에서는 충분히 동작하지만, **웹** 환경에서는 URL 동기화, 브라우저 히스토리 관리 등의 이유로 더 확장된 라우팅 기능이 필요하다. 
- Beamer는 이러한 복잡한 라우팅 요구사항을 해결해주는 도구이다.

### 왜 Beamer가 모바일보다 웹에서 많이 사용될까?

1. **URL 동기화**  
- 웹에서는 **URL**이 매우 중요하다. 사용자가 특정 페이지에 접근하거나 브라우저의 뒤로가기 버튼을 눌렀을 때, 앱의 상태와 URL이 항상 일치해야 한다. 
- Beamer는 이러한 **URL과 앱 상태를 동기화**하는 기능을 제공한다. 
- 반면, 모바일 앱에서는 URL을 통한 탐색이 필요 없다. 기본적으로 내비게이션 스택으로 관리하기 때문이다. (네이티브도 마찬가지)
- 모바일: 사용자가 앱 내에서 "뒤로 가기" 버튼을 눌러도 URL은 바뀌지 않고, 단지 앱의 내비게이션 스택에서 이전 화면으로 돌아갈 뿐이다.
- 웹: 사용자가 브라우저의 "뒤로 가기" 버튼을 누르면, URL이 바뀌고 그에 맞는 페이지가 나타나야 한다. 그리고 URL을 직접 입력해도 해당 페이지로 이동해야 한다.


2. **브라우저 히스토리 관리**  
- 웹에서 사용자가 브라우저의 "뒤로 가기" 버튼을 누르면, 앱 내에서도 이전 페이지로 이동해야 한다. Beamer는 **브라우저 히스토리**와 Flutter 라우팅을 동기화하여 웹 환경에서 더 자연스러운 탐색을 가능하게 한다. 모바일에서는 앱 내에서의 탐색이 **스택 기반**으로 이루어지므로, 브라우저 히스토리 관리가 필요하지 않다.

3. **동적 URL 관리**  
- 웹 애플리케이션에서는 **동적 URL**이 자주 사용된다. 동적 URL을 사용해야 같은 경로 안에서도 개별적인 데이터를 구분할 수 있고, 특정 사용자의 정보나 페이지를 불러올 수 있기 때문이다.
- 예를 들어, `/profile/123`과 같이 URL에 동적으로 값을 전달하여 특정 데이터를 불러와야 할 때가 많다.
- Beamer는 이러한 동적 URL 관리에 적합하며, URL의 일부를 쉽게 파싱하고 처리할 수 있게 해준다. 
- 반면, 모바일에서는 보통 내비게이션을 통해 화면 간 이동을 처리하며, URL 관리가 필요하지 않다.

### Beamer의 장점

- **URL과 앱 상태의 동기화**: 브라우저의 URL과 앱의 상태를 자동으로 맞춰준다.
- **Deep Linking**: 동적 URL을 쉽게 처리할 수 있다.
- **브라우저 히스토리 관리**: 뒤로 가기 버튼 등 브라우저 네이티브 기능과 앱 상태를 쉽게 동기화한다.
- **중첩된 라우팅**: 복잡한 내비게이션 구조도 효율적으로 관리할 수 있다.

### Beamer 예제 코드

```dart
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: BeamerDelegate(
        initialPath: '/home',
        locationBuilder: SimpleLocationBuilder(
          routes: {
            '/home': (context, state, data) => HomeScreen(),
            '/profile/:userId': (context, state, data) {
              final userId = state.pathParameters['userId'];
              return ProfileScreen(userId: userId);
            },
          },
        ),
      ),
      routeInformationParser: BeamerParser(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Beamer.of(context).beamToNamed('/profile/123'),
          child: Text('Go to Profile'),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String userId;
  ProfileScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile $userId')),
      body: Center(child: Text('Profile of user $userId')),
    );
  }
}
```