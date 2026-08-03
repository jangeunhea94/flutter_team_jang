import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  // Properties
  late TextEditingController num1Controller;    // 첫 번째 숫자 입력
  late TextEditingController num2Controller;    // 두 번째 숫자 입력
  late String calcResult;                       // 계산 결과

  @override
  void initState() {
    super.initState();

    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    calcResult = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("나눗셈"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              // 숫자 입력 필드
              TextField(
                controller: num1Controller,
                decoration: InputDecoration(
                  labelText: "첫 번째 숫자를 입력하세요"
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: num2Controller,
                decoration: InputDecoration(
                  labelText: "두 번째 숫자를 입력하세요"
                ),
                keyboardType: TextInputType.number,
              ),
              // 버튼
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                  onPressed: () => calculate(),
                  child: Text("OK")
                ),
              ),
              // 계산 결과
              Text(
                calcResult,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  // Functions
  // 나눗셈 연산 후 결과 출력
  void calculate() {
    if(num1Controller.text.trim().isEmpty || num2Controller.text.trim().isEmpty) {
      calcResult = "숫자를 입력하세요.";
    }
    else {
      int num1 = int.parse(num1Controller.text.trim());
      int num2 = int.parse(num2Controller.text.trim());

      if(num2 == 0) {
        calcResult = "0으로 나눌 수 없습니다.";
      }
      else {
        double div = num1 / num2;
        calcResult = "$num1 / $num2 = $div";
      }
    }

    setState(() {});
  }
}