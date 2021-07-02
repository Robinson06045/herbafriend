import 'dart:convert';

import 'package:herbafriend/src/model/herbafriend_model.dart';
import 'package:http/http.dart' as http;

class HerbaFriendService {
  HerbaFriendService();

  //Future, indica que es una llama asíncrona
  Future<List<Recipes>> getRecipes() async {
    List<Recipes> items = [];
    try {
      var uri = Uri.https("backhebrafriend.herokuapp.com", "/recipes");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final recipe = new Recipes.fromJson(item);
        items.add(recipe);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
}
