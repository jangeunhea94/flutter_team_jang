import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late String calcresult;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    calcresult = "";

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("뺄셈"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              decoration: InputDecoration(
                labelText: "첫 번째 숫자를 입력하세요."
              ),
              keyboardType: TextInputType.number, 
            ),
            TextField(
              controller: num2Controller,
              decoration: InputDecoration(
                labelText: "두 번째 숫자를 입력하세요."
              ),
              keyboardType: TextInputType.number,         
            ),
            ElevatedButton(
              onPressed: _calculate, 
              child: Text("OK"),
            ),
            Text(
              calcresult)
          ],
        ),
      ),
    );
  }

  void _calculate(){
    if(num1Controller.text.trim().isEmpty || num2Controller.text.trim().isEmpty){
      calcresult = "숫자를 입력하세요.";
    }else{
      int num1 = int.parse(num1Controller.text.trim());
      int num2 = int.parse(num2Controller.text.trim());

      int sub = num1 - num2;
      calcresult = "$num1 - $num2 = $sub";
    }
    setState(() {
      
    });
  } 
}