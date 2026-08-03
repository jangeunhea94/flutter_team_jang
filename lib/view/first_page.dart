import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  //Property
  late TextEditingController num1comtroller;
  late TextEditingController num2comtroller;

  late TextEditingController addController;
  late String addReserve;

  @override
  void initState() {
    super.initState();
    num1comtroller = TextEditingController();
    num2comtroller = TextEditingController();

    addController =  TextEditingController();
    addReserve = '';
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
              TextField(
                controller: num1comtroller,
                decoration: InputDecoration(
                  labelText: '첫번째 숫자를 입력하시오',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: num2comtroller,
                decoration: InputDecoration(
                  labelText: '두번째 숫자를 입력하시오',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
                
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: calcResult, 
                child: Text('OK'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: addController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: '',
                    border: InputBorder.none,
                  ),

                )
            ],
          )
        ),
      ),
    );
  } //build

  void calcResult() {
  int num1 = int.parse(num1comtroller.text.trim());
  int num2 = int.parse(num2comtroller.text.trim());

  int addResult = num1 + num2;

  addController.text = '$num1 + $num2 = $addResult';

  setState(() {});
}
}//class