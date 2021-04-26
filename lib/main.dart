
import 'package:dropdown_function/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Dropdown Button';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    home: MainPage(title: title),
  );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class NewObject {
  final String title;


  NewObject(this.title);
}

class _MainPageState extends State<MainPage> {
  static final List<NewObject> items1 = <NewObject>[
    NewObject('Apple'),
    NewObject('Banana'),
    NewObject('Orange'),
    NewObject('Other Fruit'),
  ];
  NewObject value1 = items1.first;

  static final List<NewObject> items2 = <NewObject>[
    NewObject('Apple'),
    NewObject('Banana'),
    NewObject('Orange'),
    NewObject('Other Fruit'),
  ];
  NewObject value2 = items2.first;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Center(
      child: Column(
        children: [
          buildDropdown1(),
          SizedBox(height: 10.0,),
          buildDropdown2(),
          SizedBox(height: 10.0,),
          RaisedButton(
              child: Text('Submit'),
              color: Colors.yellow,
              onPressed: (){
                // ignore: unrelated_type_equality_checks
                if(value1 == items1.elementAt(0)&& value2 ==items2.elementAt(1)){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                }

              }
          )
        ],
      ),
    ),
  );

  Widget buildDropdown1() => Container(
    width: 200,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      border: Border.all(color: Colors.deepOrange, width: 4),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<NewObject>(
        value: value1, // currently selected item
        items: items1
            .map((item) => DropdownMenuItem<NewObject>(
          child: Row(
            children: [
              const SizedBox(width: 8),
              Text(
                item.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          value: item,
        ))
            .toList(),
        onChanged: (value) => setState(() {
          this.value1 = value;
        }),
      ),
    ),
  );
  Widget buildDropdown2() => Container(
    width: 200,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      border: Border.all(color: Colors.deepOrange, width: 4),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<NewObject>(
        value: value2, // currently selected item
        items: items2
            .map((item) => DropdownMenuItem<NewObject>(
          child: Row(
            children: [
              const SizedBox(width: 8),
              Text(
                item.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          value: item,
        ))
            .toList(),
        onChanged: (value) => setState(() {
          this.value2 = value;
        }),
      ),
    ),
  );
}