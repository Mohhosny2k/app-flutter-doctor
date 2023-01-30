import 'doctor_model.dart';
import 'doctor_states.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

final String domainAddress =
    'https://doctor-consultation-aab0a-default-rtdb.firebaseio.com';

class DoctorController extends Cubit<DoctorState> {
  DoctorController() : super(DoctorInitialState()) {
    getCategory();
    getDoctor();
    getTop();
    getKidney();
    getEyes();
    getBone();
  }
  List<DoctorModel> _allDoctor = [];
  List<DoctorModel> get allldoctor => _allDoctor;
  List<CategoryModel> _allCategory = [];
  List<CategoryModel> get allcategory => _allCategory;
  List<DoctorModel> _allTop = [];
  List<DoctorModel> get allltop => _allTop;
  List<DoctorModel> _allKidney = [];
  List<DoctorModel> get alllkidney => _allKidney;
  List<DoctorModel> _allEyes = [];
  List<DoctorModel> get allleyes => _allEyes;
  List<DoctorModel> _allBone = [];
  List<DoctorModel> get alllbone => _allBone;

  Future<void> getDoctor() async {
    emit(GetDoctorLoadingState());
    try {
      http.Response res =
          await http.get(Uri.parse('$domainAddress/doctor.json'));
      Map data = json.decode(res.body);
      if (res.statusCode == 200) {
        _allDoctor.clear();
        data.forEach((key, value) {
          DoctorModel Doctor = DoctorModel.fromJson(key, value);
          _allDoctor.add(Doctor);
          emit(GetDoctorSuccessState());
        });
        print('donedoctor');
      } else {
        emit(GetDoctorErrorState());
      }
    } catch (e) {
      emit(GetDoctorErrorState());
    }
  }

  Future<void> getCategory() async {
    emit(GetCategoryLoadingState());
    try {
      http.Response res =
          await http.get(Uri.parse('$domainAddress/category.json'));
      Map data = json.decode(res.body);
      if (res.statusCode == 200) {
        _allCategory.clear();
        data.forEach((key, value) {
          _allCategory.add(CategoryModel(
              image: value['image'],
              nameDectorFirst: value['nameDectorFirst'],
              nameDectorSecond: value['nameDectorSecond'],
              specialist: value['specialist']));
          emit(GetCategorySuccessState());
        });
        print('doneCategory');
      } else {
        emit(GetCategoryErrorState());
      }
    } catch (e) {
      emit(GetCategoryErrorState());
    }
  }

  Future<void> getTop() async {
    emit(GetTopLoadingState());
    try {
      http.Response res =
          await http.get(Uri.parse('$domainAddress/doctor.json'));
      Map data = json.decode(res.body);
      if (res.statusCode == 200) {
        _allTop.clear();
        _allTop.clear();
        data.forEach((key, value) {
          if (value['top'] == true) {
            _allTop.add(DoctorModel.fromJson(key, value));
          }
        });
        print('doneTop');
        emit(GetTopSuccessState());
      } else {
        print('Error topppppp');
        emit(GetTopErrorState());
      }
    } catch (e) {
      print('$e error  top22');
      print('Error topppppp222222');
      emit(GetTopErrorState());
    }
  }

  Future<void> getKidney() async {
    emit(GetKidneyLoadingState());
    try {
      http.Response res =
          await http.get(Uri.parse('$domainAddress/doctor.json'));
      Map data = json.decode(res.body);
      if (res.statusCode == 200) {
        _allKidney.clear();
        _allKidney.clear();
        data.forEach((key, value) {
          if (value['kidney'] == true) {
            _allKidney.add(DoctorModel.fromJson(key, value));
          }
        });
        print('doneKidney');
        emit(GetKidneySuccessState());
      } else {
        emit(GetKidneyErrorState());
      }
    } catch (e) {
      emit(GetKidneyErrorState());
    }
  }

  Future<void> getEyes() async {
    emit(GetEyesLoadingState());
    try {
      http.Response res =
          await http.get(Uri.parse('$domainAddress/doctor.json'));
      Map data = json.decode(res.body);
      if (res.statusCode == 200) {
        _allEyes.clear();
        _allEyes.clear();
        data.forEach((key, value) {
          if (value['eyes'] == true) {
            _allEyes.add(DoctorModel.fromJson(key, value));
          }
        });
        print('doneEyes');
        emit(GetEyesSuccessState());
      } else {
        emit(GetEyesErrorState());
      }
    } catch (e) {
      emit(GetEyesErrorState());
    }
  }

  Future<void> getBone() async {
    emit(GetBoneLoadingState());
    try {
      http.Response res =
          await http.get(Uri.parse('$domainAddress/doctor.json'));
      Map data = json.decode(res.body);
      if (res.statusCode == 200) {
        _allBone.clear();
        _allBone.clear();
        data.forEach((key, value) {
          if (value['bone'] == true) {
            _allBone.add(DoctorModel.fromJson(key, value));
          }
        });
        print('doneBone');
        emit(GetBoneSuccessState());
      } else {
        emit(GetBoneErrorState());
      }
    } catch (e) {
      emit(GetBoneErrorState());
    }
  }
}
