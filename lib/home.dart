import 'package:flutter/material.dart';

import 'package:tabbar_app/view/first_page.dart';
import 'package:tabbar_app/view/fourth_page.dart';
import 'package:tabbar_app/view/second_page.dart';
import 'package:tabbar_app/view/third_page.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {       // vsync를 사용할 때 흔히 쓰임.

  // Property
  late TabController controller;

  @override
  void initState() {                              // 초기 화면 구성
    super.initState();

    controller = TabController(
      length: 4,                                  // Tab 4개로 나누겠다.
      vsync: this,                                // Tab 전환 애니메이션을 관리하기 위해 필요.
    );
  }

  @override
  void dispose() {                                // 불필요한 데이터를 삭제
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tab Bar Test'),
      ),

      body: TabBarView(                         // 실제로 화면을 보여줄 페이지
        controller: controller,                 // 사용자가 TabBar를 누르면 TabBarView를 보여준다.
        children: [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
          FourthPage(),
        ],
      ),

      bottomNavigationBar: Container(               // 화면 맨 아래에 영역을 만들고, Container 로 감싼다.
        color: Colors.amber,                      // 색은 노란색
        height: 80,                                 // 높이는 80  
        child: TabBar(
          controller: controller,                   // TabBarView와 같은 controller
          labelColor: Colors.red,                 // 선택된 글은 붉은 색
          indicatorColor: Colors.red,             //  표시선의 색깔, 아래에 표신된다.

          tabs: [
            Tab(
              icon: Icon(Icons.add),
              text : "Add",
            ),
            Tab(
              icon: Icon(Icons.remove),
              text : "Sub",
            ),
            Tab(
              icon: Icon(Icons.close),
              text : "Mul",
            ),
            Tab(
              icon: Icon(Icons.percent),
              text : "Div",
            ),
          ],
        ),
      ),
    );
  }
}