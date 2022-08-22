import 'package:flutter/material.dart';


import 'medicine.dart';

class NewsModel  {
  String name="",strength="";


  NewsModel({
     required this.name,
     required this.strength,

  });

   factory NewsModel.fromJson(dynamic json) {
     return
       NewsModel (
     name: json["problems"][0]["Diabetes"][0]["medications"][0]["medicationsClasses"][0]["className"][0]["associatedDrug"] [0]["name"] ?? "",
     strength:json["problems"][0]["Diabetes"][0]["medications"][0]["medicationsClasses"][0]["className"][0]["associatedDrug"] [0]["strength"] ?? ""
       ) ;
   }


  static List<NewsModel> newsFromSnapshot(List newSnapshot) {
    return newSnapshot.map((json) {
      return NewsModel.fromJson(json);
    }).toList();
  }




}
