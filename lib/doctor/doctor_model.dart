import 'package:flutter/material.dart';

class DoctorModel {
  dynamic anthorMess;
  bool bone;
  dynamic clockFour;
  dynamic clockOne;
  dynamic clockSeven;
  dynamic clockSix;
  dynamic clockThree;
  dynamic clockTwo;
  dynamic description;
  num experience;
  bool eyes;
  bool fri17;
  dynamic images;//
  bool kidney;
  dynamic messageFive;
  dynamic messageOne;
  dynamic messageSeven;
  dynamic messageSix;
  dynamic messageTwo;
  dynamic messagefour;
  dynamic messagethree;
  bool mon13;
 dynamic nameDoctor;//
  dynamic nameFiveDay;
  dynamic nameFourDay;
  dynamic nameOneDay;
  dynamic nameSevenDay;
  dynamic nameSixDay;
  dynamic nameThreeDay;
  dynamic nameTwoDay;
  num numFri;
  num numMon;
  num numPatient;
  num numSat;
  num numSun;
  num numThu;
  num numTue;
  num numWed;
  num rating;
  bool sat18;
  bool sun12;
  bool thu16;
  bool top;
  bool tue14;
  bool wed15;
  dynamic id;
  dynamic spcName;//
  DoctorModel({
    required this.anthorMess,
    required this.bone,
    required this.clockFour,
    required this.clockOne,
    required this.clockSeven,
    required this.clockSix,
    required this.clockThree,
    required this.clockTwo,
    required this.description,
    required this.experience,
    required this.eyes,
    required this.fri17,
    required this.images,
    required this.kidney,
    required this.messageFive,
    required this.messageOne,
    required this.messageSeven,
    required this.messageSix,
    required this.messageTwo,
    required this.messagefour,
    required this.messagethree,
    required this.mon13,
    required this.nameDoctor,
    required this.nameFiveDay,
    required this.nameFourDay,
    required this.nameOneDay,
    required this.nameSevenDay,
    required this.nameSixDay,
    required this.nameThreeDay,
    required this.nameTwoDay,
    required this.numFri,
    required this.numMon,
    required this.numPatient,
    required this.numSat,
    required this.numSun,
    required this.numThu,
    required this.numTue,
    required this.numWed,
    required this.rating,
    required this.sat18,
    required this.sun12,
    required this.thu16,
    required this.top,
    required this.tue14,
    required this.wed15,
    required this.id,
    required this.spcName,
  });

  factory DoctorModel.fromJson(String id, Map data) {
    return DoctorModel(
        anthorMess: data['anthorMess'],
        bone: data['bone'],
        clockFour: data['clockFour'],
        clockOne: data['clockOne'],
        clockSeven: data['clockSeven'],
        clockSix: data[' clockSix'],
        clockThree: data[' clockThree'],
        clockTwo: data['clockTwo'],
        description: data[' description'],
        experience: data['experience'],
        eyes: data['eyes'],
        fri17: data['fri17'],
        images: data['images'],
        kidney: data['kidney'],
        messageFive: data[' messageFive'],
        messageOne: data['messageOne'],
        messageSeven: data['messageSeven'],
        messageSix: data['messageSix'],
        messageTwo: data['messageTwo'],
        messagefour: data[' messagefour'],
        messagethree: data['messagethree'],
        mon13: data['mon13'],
        nameDoctor: data['nameDoctor'],
        nameFiveDay: data['nameFiveDay'],
        nameFourDay: data['nameFourDay'],
        nameOneDay: data['nameOneDay'],
        nameSevenDay: data['nameSevenDay'],
        nameSixDay: data[' nameSixDay'],
        nameThreeDay: data['nameThreeDay'],
        nameTwoDay: data['nameTwoDay'],
        numFri: data['numFri'],
        numMon: data['numMon'],
        numPatient: data['numPatient'],
        numSat: data['numSat'],
        numSun: data['numSun'],
        numThu: data['numThu'],
        numTue: data['numTue'],
        numWed: data['numWed'],
        rating: data['rating'],
        sat18: data['sat18'],
        sun12: data['sun12'],
        thu16: data['thu16'],
        top: data['top'],
        tue14: data['tue14'],
        wed15: data['wed15'],
        spcName: data['spcName'],
        id: id);
  }
}

class CategoryModel {
  String image;
  String nameDectorFirst;
  String nameDectorSecond;
  String specialist;

  CategoryModel({
    required this.image,
    required this.nameDectorFirst,
    required this.nameDectorSecond,
    required this.specialist,
  });
}
