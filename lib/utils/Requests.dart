import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'Constantes.dart';
import 'StockageKeys.dart';

class HttpResponse {
  bool status;
  Map? data;
  String? errorMsg;
  bool? isError;
  bool? isException;

  HttpResponse(
      {this.data,
        required this.status,
        this.errorMsg,
        this.isError,
        this.isException}
      );
}
GetStorage storage = GetStorage();

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

Future<dynamic> getData(String urlApi, {String? token}) async {
  try {
    var url = Uri.parse("${Constantes.BASE_URL}$urlApi");
    var reponse = await http.get(url,
        headers: {
          "Authorization":"Bearer ${token??storage.read(StockageKeys.token)}"}).timeout(Duration(seconds: 2)
    );
    if (reponse.statusCode == 200) {
      return json.decode(reponse.body);
    }
    return null;

  } catch (e, trace) {
    print(e.toString());
    print(trace.toString());

    return null;
  }
}

Future<HttpResponse> patchData(String api_url, Map data,
    {String? token}) async {
  try {
    var url = Uri.parse("${Constantes.BASE_URL}$api_url");
    String dataStr = json.encode(data);
    var tkn = token ?? storage.read(StockageKeys.token);
    var response = await http.patch(url, body: dataStr, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $tkn"
    }).timeout(Duration(seconds: 5));

    var successList = [200, 201];
    var msg = json.decode(response.body);
    var st = successList.contains(response.statusCode);
    return HttpResponse(status: st, data: msg);

  } catch (e, trace) {
    print(e.toString());
    print(trace.toString());

    return HttpResponse(
        status: false, errorMsg: "Erreur inattendue", isException: true);
  }
}

Future<HttpResponse> postData(String api_url, Map data, {String? token}) async {
  try {
    var url = Uri.parse("${Constantes.BASE_URL}$api_url");
    print(url);
    String dataStr = json.encode(data);
    var _tkn = token ?? storage.read(StockageKeys.token);
    var response = await http.post(url, body: dataStr, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $_tkn"
    }).timeout(Duration(seconds: 5));
    print("BODY : ${response.body}");
    if(!kReleaseMode){
      // alice.onHttpResponse(response);
    }

    var successList = [200, 201];
    var msg = json.decode(response.body);
    var st = successList.contains(response.statusCode);
    if (response.statusCode == 500) throw Exception(msg);
    return HttpResponse(status: st, data: msg); // {"status": st, "msg": msg};

  } catch (e, trace) {
    printWrapped(" ERREUR E: ${e.toString()}");
    printWrapped("ERREUR TRACE :${trace.toString()}");

    return HttpResponse(
        status: false,
        errorMsg: "Erreur inattendue, Problème de connexion",
        isException: true); // {"status": st, "msg": msg};
  }
}





