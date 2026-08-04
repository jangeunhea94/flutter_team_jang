import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  //Property
  late TextEditingController num1controller;  // 첫번째 숫자
  late TextEditingController num2controller;  // 두번째 숫자

  late String calResult;                      // 계산 결과

  @override
  void initState() {
    super.initState();
    num1controller = TextEditingController();
    num2controller = TextEditingController();

    calResult = '';
  }
  @override
    void dispose() {
      num1controller.dispose();
      num2controller.dispose();
      super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text('덧셈'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body : Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 첫번째 숫자 입력받기
              TextField(
                textAlign: TextAlign.center,
                controller: num1controller,
                decoration: InputDecoration(
                  labelText: '첫번째 숫자를 입력하시오',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 30,
              ),

              //두번째 숫자 입력받기
              TextField(
                textAlign: TextAlign.center,
                controller: num2controller,
                decoration: InputDecoration(
                  labelText: '두번째 숫자를 입력하시오',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
                
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: calcResult, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                 child: Text('OK'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    calResult,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
              ),
            ],
          )
        ),
      ),
    );
  } //build

  void calcResult() {
  int num1 = int.parse(num1controller.text.trim());
  int num2 = int.parse(num2controller.text.trim());

  int add = num1 + num2;

  setState(() {
    calResult = "$num1 + $num2 = $add";
  });
}
}//class