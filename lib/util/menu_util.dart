import 'package:flutter/cupertino.dart';

import '../route_page.dart';

final class MenuUtil {
  static final List<String> menuList = ["회사소개", "포토폴리오", "채용", "문의"];

  static void changeIndex(BuildContext context, int index) {
     String routeName = "";
     switch (index) {
       case 0:
         routeName = RoutePage.company;
         break;
       case 1:
         routeName = RoutePage.portfolio;
         break;
       case 2:
         routeName = RoutePage.recruit;
         break;
       case 3:
         routeName = RoutePage.question;
         break;
     }

     RoutePage.movePage(context, routeName);
  }

}