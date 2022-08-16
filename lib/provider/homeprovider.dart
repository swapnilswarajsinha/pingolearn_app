import 'package:flutter/material.dart';
import 'package:owlbot_dart/owlbot_dart.dart';
import 'package:pingolearn_app/models/word_data_model.dart';

class HomeProvider with ChangeNotifier {
  WordData? wordData;
  bool dataScreen = false;
  final OwlBot owlBot =
      OwlBot(token: "9029303106f3eba4e4a81d2db829bfcaff8c191b");

  Future<void> retrieveData(String word) async {
    final OwlBotResponse? res = await owlBot.define(word: word);
    if (res == null) {
      
    }
    res!.definitions!.forEach((element) {
      wordData = WordData(
          word: res.word,
          meaning: element.definition,
          example: element.example,
          imageUrl: element.imageUrl);
    });
    dataScreen = true;
    notifyListeners();
  }
}
