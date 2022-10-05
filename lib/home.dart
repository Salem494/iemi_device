import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  static const imeiChannel = MethodChannel("imei");
  String imei = "unknow";
  final FlutterWebviewPlugin flutterWebViewPlugin = FlutterWebviewPlugin();

  setToken(){
  final token = flutterWebViewPlugin.evalJavascript("window.localStorage.setItem('token','SOMETOKEN')");
  print(token);
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    setToken();
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: getIMEINumber,
        child: Center(
          child: Text(imei),
        ),
      ),
    );
  }

  Future<void> getIMEINumber() async{
    String imeiNo = "";
    try{
     String result  = await imeiChannel.invokeMethod('getIMEINumber');
      imeiNo = result;
      print("imeiNo  :${imeiNo}");
    }
    on Exception catch(e) {
      print("Error : ${e}");
    }
     setState(() {
       imei = imeiNo;
     });
  }
}
