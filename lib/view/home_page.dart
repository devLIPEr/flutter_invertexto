import 'package:flutter/material.dart';
import 'package:invertexto_api/view/busca_cep_page.dart';
import 'package:invertexto_api/view/gera_qr_code_page.dart';
import 'package:invertexto_api/view/por_extenso_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeStatePage();
}

class _HomeStatePage extends State<HomePage> {
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
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 223, 223, 223),
                    size: 40,
                  ),
                  SizedBox(width: 10,),
                  Text("Por Extenso",
                      style: TextStyle(color: Colors.white, fontSize: 22))
                ],
              ),
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PorExtensoPage()));
              }),
            ),
            SizedBox(height: 15),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 223, 223, 223),
                    size: 40,
                  ),
                  SizedBox(width: 10,),
                  Text("Consulta CEP",
                      style: TextStyle(color: Colors.white, fontSize: 22))
                ],
              ),
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BuscaCEPPage()));
              }),
            ),
            SizedBox(height: 15),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.qr_code_scanner,
                    color: Color.fromARGB(255, 223, 223, 223),
                    size: 40,
                  ),
                  SizedBox(width: 10,),
                  Text("Gerador de QR Code",
                      style: TextStyle(color: Colors.white, fontSize: 22))
                ],
              ),
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QRCodePage()));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
