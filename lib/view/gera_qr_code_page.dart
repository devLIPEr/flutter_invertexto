import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:invertexto_api/service/invertexto_service.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({super.key});

  @override
  State<QRCodePage> createState() => _QRCodeStatePage();
}

class _QRCodeStatePage extends State<QRCodePage> {
  String? text;
  String color = "000000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 58, 58, 58),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/imgs/invertexto.png",
              fit: BoxFit.contain,
              height: 40,
            ),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 58, 58, 58),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Digite um texto para gerar o QR",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: (value) {
                setState(() {
                  text = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Digite uma cor em hexadecimal",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: (value) {
                setState(() {
                  color = value;
                  print(color);
                });
              },
              maxLength: 6,
            ),
            Expanded(
              child: FutureBuilder(
                future: (text != null && color.length == 6) ? geraQRCode(text, color) : null,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 5.0,
                        ),
                      );
                    default:
                      if (snapshot.hasData) {
                        return exibeResultado(context, snapshot);
                      }
                      return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // https://stackoverflow.com/questions/46145472/how-to-convert-base64-string-into-image-with-flutter
  Image imageFromBase64(String base64String){
    return Image.memory(base64Decode(base64String.substring(22)), scale: 0.6,);
  }

  Widget exibeResultado(BuildContext context, AsyncSnapshot snapshot) {
    if(snapshot.data["message"] != null){
      return Container();
    }
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: imageFromBase64(snapshot.data["image"]),
    );
  }
}
