import 'package:flutter/material.dart';
import 'package:my_first_app/home.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
          },
        ),
      ),
    );
  }
}
