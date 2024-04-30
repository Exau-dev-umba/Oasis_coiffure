
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oasis_coiffure/models/SpecialisationModel.dart';

import '../utils/Constantes.dart';
import '../utils/Endpoints.dart';
import '../utils/Requests.dart';
import '../utils/StockageKeys.dart';

class SpecialisationController with ChangeNotifier{

  GetStorage? stockage;
  List<SpecialisationModel> specialisations = [];
  SpecialisationModel? specialisation;
  bool loading = false;
  bool? isHttpException;

  SpecialisationController({this.stockage});

  void getSpecialisations() async {
    var url = Endpoints.specialisations;
    var tkn = stockage?.read(StockageKeys.token)?? Constantes.defToken;
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: tkn);

    if(reponse!=null && reponse!=[]){
      specialisations=reponse["data"].map<SpecialisationModel>((e) => SpecialisationModel.fromJson(e)).toList();
      print("DATAS: ${reponse}");
      print("DATAS CONVERTE: ${specialisations}");
      isHttpException = false;
    }else{
      isHttpException = true;
    }
    loading = false;
    notifyListeners();
  }
}