import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oasis_coiffure/models/ReservationModel.dart';

import '../utils/Constantes.dart';
import '../utils/Endpoints.dart';
import '../utils/Requests.dart';
import '../utils/StockageKeys.dart';

class ReservationController with ChangeNotifier{

  GetStorage? stockage;
  List<ReservationModel> reservations = [];
  ReservationModel? reservation;
  bool loading = false;
  bool? isHttpException;

  ReservationController({this.stockage});

  void getReservations() async {
    var url = Endpoints.getAllReservationsByClient;
    var tkn = stockage?.read(StockageKeys.token)?? Constantes.defToken;
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: tkn);

    if(reponse!=null && reponse!=[]){
      reservations=reponse["data"].map<ReservationModel>((e) => ReservationModel.fromJson(e)).toList();
      print("DATAS: ${reponse}");
      print("DATAS CONVERTE: ${reservations}");
      isHttpException = false;
    }else{
      isHttpException = true;
    }
    loading = false;
    notifyListeners();
  }

  Future<HttpResponse> reserverPlaceCoiffure(Map data) async {
    var token=stockage?.read(StockageKeys.token) ;
    var url =Endpoints.reservationPlaceCoiffure;
    loading = true;
    notifyListeners();
    HttpResponse response = await postData(url, data, token: token);
    if(response.status){
      reservation=ReservationModel.fromJson(response.data?['user'] ?? {});
      // stockage?.write(StockageKeys.tokenKey, response.data?["token"]?? "");
      notifyListeners();
    }
    print(response.data);
    print("=================${response.errorMsg}");
    return response;
  }


}