import 'package:flutter/material.dart';
import 'package:invertexto_api/service/invertexto_service.dart';

class PorExtensoPage extends StatefulWidget {
  const PorExtensoPage({super.key});

  @override
  State<PorExtensoPage> createState() => _PorExtensoStatePage();
}

class _PorExtensoStatePage extends State<PorExtensoPage> {
  String? campo;

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
                labelText: "Digite um número",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: (value) {
                setState(() {
                  campo = value;
                });
              },
            ),
            Expanded(
              child: FutureBuilder(
                future:
                    (campo != null) ? converteNumeroPorExtenso(campo) : null,
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
                      if(snapshot.hasData){
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

  Widget exibeResultado(BuildContext context, AsyncSnapshot snapshot) {
    if(snapshot.data["message"] != null){
      return Container();
    }
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        snapshot.data["text"],
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}
