import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oasis_coiffure/models/CoiffureModel.dart';
import '../utils/Constantes.dart';
import '../utils/Endpoints.dart';
import '../utils/Requests.dart';
import '../utils/StockageKeys.dart';

class CoiffureController with ChangeNotifier{
  GetStorage? stockage;
  List<CoiffureModel> coiffures = [];
  CoiffureModel? coiffure;
  bool loading = false;
  bool? isHttpException;

  CoiffureController({this.stockage});

  void getCoiffures() async {
    var url = Endpoints.coiffures;
    var tkn = stockage?.read(StockageKeys.token)?? Constantes.defToken;
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: tkn);

    if(reponse!=null && reponse!=[]){
      coiffures=reponse["data"].map<CoiffureModel>((e) => CoiffureModel.fromJson(e)).toList();
      print("DATAS: ${reponse}");
      print("DATAS CONVERTE: ${coiffures}");
      isHttpException = false;
    }else{
      isHttpException = true;
    }
    loading = false;
    notifyListeners();
  }

  void getOneCoiffure(coiffureId) async {
    var urlWithRepaId = Endpoints.getOnecoiffure.replaceAll("{id}", coiffureId.toString());
    var url = urlWithRepaId;
    var tkn = stockage?.read(StockageKeys.token)?? Constantes.defToken;
    loading = true;
    notifyListeners();
    var response = await getData(url, token: tkn);
    if(response!=null){
      coiffure=CoiffureModel.fromJson(response);
      isHttpException = false;
    }else{
      isHttpException = true;
      var forATimeData = CoiffureModel.fromJson(response ?? {});
      coiffure = forATimeData;
    }
    loading = false;
    notifyListeners();
  }
}

void main(){
  var c = CoiffureController();
  c.getCoiffures();
}