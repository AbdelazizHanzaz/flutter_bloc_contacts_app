import 'package:flutter/material.dart';



class SettingScreen extends StatefulWidget {

  const SettingScreen({ Key? key, required this.title }) : super(key: key);
       
 
  final String title;
  static const routeName = "/settings";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  

  @override
  Widget build(BuildContext context) {
    
           
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text("Settings:"),
      ),
    );
  }
}