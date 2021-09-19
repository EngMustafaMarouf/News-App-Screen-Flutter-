import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

enum SportType { Training, Running }

class Sport {
  final String description;
  final String imageUrl;
  final String date;
  final SportType sportType;
  final int number;

  Sport({
    @required this.description,
    @required this.imageUrl,
    @required this.date,
    @required this.sportType,
    @required this.number,
  });
}

class MyProvider with ChangeNotifier {


  List<Sport> sportList = [
    Sport(
        description: "Abdominal  muscle exercises\n 1.week",
        imageUrl: "images/1.jpg",
        date: DateTime.now().year.toString()+" "+DateTime.now().month.toString()+" "+DateTime.now().day.toString(),
        sportType: SportType.Training,
        number: 5),
    Sport(
        description: "Strengthening the biceps\nmuscles 2.week",
        imageUrl: "images/2.jpg",
        date: DateTime.now().year.toString()+" "+DateTime.now().month.toString()+" "+DateTime.now().day.toString(),
        sportType: SportType.Training,
        number: 10),
    Sport(
        description: "Burning body fat\n 3.week",
        imageUrl: "images/3.jpg",
        date: DateTime.now().year.toString()+" "+DateTime.now().month.toString()+" "+DateTime.now().day.toString(),
        sportType: SportType.Running,
        number: 20),
    Sport(
        description: "Toning the abdominal\n muscles 4.week",
        imageUrl: "images/4.jpg",
        date: DateTime.now().year.toString()+" "+DateTime.now().month.toString()+" "+DateTime.now().day.toString(),
        sportType: SportType.Training,
        number: 8),
  ];



}
