import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("แอพคำนวณ")),
      body: Home(),
    ));
  }
}

class Home extends StatefulWidget {
  // const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //ตำแหน่งสำหรับเก็บข้อมูลของค่าที่ user กรอกเข้ามา
  TextEditingController quantity = TextEditingController();//ช่องสำหรับเก็บข้อมูล
  TextEditingController price = TextEditingController();//ช่องสำหรับเก็บข้อมูล
  //double price = 10;//ช่องสำหรับเก็บราคา
  TextEditingController result = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    result.text = "ซื้อเเอปเปิ้ลจำนวน x ผล ราคาผลล่ะ 10 บาท  รวมต้องจ่ายทั้งหมด x บาท";
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
              child: Column(
            children: [
              Image.asset('assets/apple.png', width: 300, ),
              Text("โปรแกรมคำนวณ", style: TextStyle(fontSize: 30),),
              TextField(
                  controller: quantity,
                  decoration: InputDecoration(
                      labelText: 'จำนวนแอปเปิ้ล', 
                      border: OutlineInputBorder())),
              SizedBox(height: 20),
              TextField(
                  controller: price,
                  decoration: InputDecoration(
                      labelText: 'ราคาแอปเปิ้ล', 
                      border: OutlineInputBorder())),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                    
                    var cal = double.parse( quantity.text) * double.parse(price.text) ;//แปลงข้อความเป็นตัวเลข
                    print("Apple quantity: ${quantity.text} Total: $cal bath");

                    setState(() {
                      result.text = "ซื้อเเอปเปิ้ลจำนวน ${quantity.text} ผล ราคาผลล่ะ 10 บาท  รวมต้องจ่ายทั้งหมด $cal บาท";
                    });

                }, 
                child: Text("คำนวณ"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff60e00b)),
                  padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                  ),
                  ),
              Text(result.text,style: TextStyle(fontSize: 20),)
            ],
          )),
        ),
      ],
    );
  }
}
