import 'package:flutter/foundation.dart';

class UtilProvider with ChangeNotifier{
  String? fileName;
  String? filePath;

  bool setFileNamePath(String? fileNameP,String? filePathP){
    fileName = fileNameP;
    filePath = filePathP;
    notifyListeners();
    return true;
  }


  String currentParsent = "0%";
  bool isLoading = false;

  setCurrentPercent(String current){
    currentParsent = current;
    notifyListeners();
  }

  setUploading(bool isLoadingU){
    isLoading = isLoadingU;
    notifyListeners();
  }

  String get currentParsentP => currentParsent;

  bool buttonClick = false;

  setButtonClick(bool buttonClick){
    this.buttonClick = buttonClick;
    notifyListeners();

  }
}