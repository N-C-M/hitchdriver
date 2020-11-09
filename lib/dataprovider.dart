
import 'package:cabdriver/datamodels/history.dart';
import 'package:flutter/material.dart';

class AppData extends ChangeNotifier{

  String earnings = '0';
  String fullname='Hari Krishna';
  String mailvalue='a@mail.com';
  String phone='9188208053';
  int tripCount = 0;
  List<String> tripHistoryKeys = [];
  List<History> tripHistory = [];

  void updateEarnings(String newEarnings){
    earnings = newEarnings;
    notifyListeners();
  }

  void updateTripCount(int newTripCount){
    tripCount = newTripCount;
    notifyListeners();
  }

  void updateTripKeys(List<String> newKeys){
    tripHistoryKeys = newKeys;
    notifyListeners();
  }

  void updateTripHistory(History historyItem){
    tripHistory.add(historyItem);
    notifyListeners();
  }

  void updateName(String dname){
    fullname=dname;
    notifyListeners();
  }

  void updateMail(String mailval){
    mailvalue=mailval;
    notifyListeners();
  }

  void updatePhn(String phonenum){
    phone=phonenum;
    notifyListeners();

  }
}