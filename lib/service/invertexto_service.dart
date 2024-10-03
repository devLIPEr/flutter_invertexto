import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String? _token = dotenv.env["TOKEN"];

Future<Map> converteNumeroPorExtenso(String? _value) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/number-to-words?token=$_token&number=$_value&language=pt&currency=BRL"));
  return json.decode(response.body);
}

Future<Map> buscaCEP(String? _cep) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/cep/$_cep?token=$_token"));
  return json.decode(response.body);
}

Future<Map> geraQRCode(String? _text, String? _color) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/qrcode?token=$_token&text=$_text&foreground=%23$_color&base64=true"));
  return json.decode(response.body);
}