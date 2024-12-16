import 'package:flutter/material.dart';
import 'information.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );

  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController speedController= TextEditingController();
  TextEditingController timeController= TextEditingController();
  String text= ' ';
  String text1='';
  information currentinformation = informations[0];
  String totalPrice = informations[0].getTotalPrice();
  String _text='';
  String _text1='';
  updatetext (String text){
    setState(() {
      _text=text;
    });
  }
  updatetext1 (String text){
    setState(() {
      _text1=text;
    });
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate discount'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body:
      Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text('your name is:$_text',style: TextStyle(fontSize: 30),),
            SizedBox(height: 10,),
            SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'enter your name',


                  ),
                  onChanged: (text) {
                    updatetext(text);
                  }
              ),
            ),
            SizedBox(height: 10,),
            Text('your email is:$_text1',style: TextStyle(fontSize: 30),),
            SizedBox(height: 10,),
            SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'enter your email',


                  ),
                  onChanged: (text) {
                    updatetext1(text);
                  }
              ),
            ),
    SizedBox(height: 20),
    Text('Select Major', style: TextStyle(fontSize: 25)),
    SizedBox(height: 10),
    MyDropdownMenuWidget(updateinformation: (def){
    setState(() {
    this.currentinformation = def;
    totalPrice = def.getTotalPrice();
    });
    }),
    SizedBox(height: 10),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(' Health Insurance', style: TextStyle(fontSize: 18)),
    Checkbox(
    value: currentinformation.insurance,
    onChanged: (bool? value) {
    setState(() {
    currentinformation.insurance = value as bool;
    totalPrice = currentinformation.getTotalPrice();
    });
    }
    )
    ],
    ),
    SizedBox(height: 10),
    Text('Total Price: $totalPrice',
    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

            SizedBox(height: 10),
            MyTextField(controller: speedController, hint:'enter total price'),
            SizedBox(height: 10),
            MyTextField(controller: timeController, hint:'enter pourcentage discount'),
            ElevatedButton(
                onPressed:(){
                  setState(() {

                    try{
                      int price = int.parse(speedController.text);
                      int discount = int.parse(timeController.text);
                      double distance = price*discount/100 ;
                      text = "Discount is : ${distance.toStringAsFixed(2)}";
                    }
                    catch(e){
                      text= "please enter a valid numbers";
                    }
                  });
                },
                child: Icon(Icons.calculate, size: 50,)
            ),
            Text('$text'),
          ],
    ),
    ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.hint,
  });
  final TextEditingController controller;
  final hint ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint,
        ),
        controller : controller,

      ),
    );
  }
}
class MyDropdownMenuWidget extends StatefulWidget {
  final Function(information) updateinformation;
  const MyDropdownMenuWidget({super.key, required this.updateinformation});

  @override
  State<MyDropdownMenuWidget> createState() => _MyDropdownMenuWidgetState();
}

class _MyDropdownMenuWidgetState extends State<MyDropdownMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 210,
      dropdownMenuEntries: informations.map((xyz) =>
          DropdownMenuEntry(value: xyz, label: xyz.toString())).toList(),
      initialSelection: informations[0],
      onSelected: (abc){
        widget.updateinformation(abc as information);
      },

    );
  }
}





