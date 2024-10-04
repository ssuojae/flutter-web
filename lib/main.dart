import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/route_page.dart';
import 'package:portfolio/screen/company/company_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routerDelegate = BeamerDelegate(
      transitionDelegate: const NoAnimationTransitionDelegate(),
      // 푸시를 통한 다음페이지 넘김 애니메이션 제거
      beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),
      // 페이지 되돌아오기 애니메이션 제거
      initialPath: RoutePage.company,
      notFoundRedirectNamed: RoutePage.company,
      // 에러처리 화면은 안만듬
      locationBuilder: RoutesLocationBuilder(routes: {
        RoutePage.company: (context, state, data) {
          return const BeamPage(
            key: ValueKey('company'),
            title: 'Company',
            child: CompanyScreen(),
          );
        },
        RoutePage.portfolio: (context, state, data) {
          return const BeamPage(
            key: ValueKey('portfolio'),
            title: 'Portfolio',
            child: CompanyScreen(),
          );
        },
        RoutePage.question: (context, state, data) {
          return const BeamPage(
            key: ValueKey('question'),
            title: 'Question',
            child: CompanyScreen(),
          );
        },
        RoutePage.recruit: (context, state, data) {
          return const BeamPage(
            key: ValueKey('recruit'),
            title: 'Recruit',
            child: CompanyScreen(),
          );
        },
      }).call);

  @override
  Widget build(BuildContext context) {
    MaterialApp.router(
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: routerDelegate),
    );
    return MaterialApp(
      title: '',
    );
  }
}
