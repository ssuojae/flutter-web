import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/route_page.dart';
import 'package:portfolio/screen/company/company_screen.dart';
import 'package:portfolio/screen/portfolio/portfolio_screen.dart';
import 'package:portfolio/screen/question/question_screen.dart';
import 'package:portfolio/screen/recruit/recruit_screen.dart';
import 'package:portfolio/util/text_util.dart';

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
            child: PortfolioScreen(),
          );
        },
        RoutePage.question: (context, state, data) {
          return const BeamPage(
            key: ValueKey('question'),
            title: 'Question',
            child: QuestionScreen(),
          );
        },
        RoutePage.recruit: (context, state, data) {
          return const BeamPage(
            key: ValueKey('recruit'),
            title: 'Recruit',
            child: RecruitScreen(),
          );
        },
      }).call);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Homepage",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade600),
        fontFamily: 'pretendard',
        textTheme: TextUtil.setTextTheme()
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: routerDelegate),
    );
  }
}
