// ignore_for_file: avoid_print, empty_catches

import 'package:hive_flutter/hive_flutter.dart';


class HiveRepo {
  static final HiveRepo _instance = HiveRepo._internal();

  factory HiveRepo() {
    return _instance;
  }
  HiveRepo._internal();

  late final Box _db;

  Future<void> init() async {
    try {
      await Hive.initFlutter();
      _db = await Hive.openBox("app_box");
    } catch (e) {}
  }

  Future<void> saveMnemonic(String mnemonic) async {
    try {
      List<String> res = List<String>.from(_db.get("mnemonics") ?? []);
      res = res.toSet().toList();
      res.add(mnemonic);
      await _db.put("mnemonics", res);
    } catch (e) {
      print(e);
    }
  }

Future<void> saveCurrencyCode(String currencyCode, ) async {
  try {
    await _db.put("currency", currencyCode); 
  } catch (e) {
    print(e);
  }
}
  Future<void> setIsNotFirstAppOpen() async {
    try {
      await _db.put("is_first_app_open", false);
    } catch (e) {
      print(e);
    }
  }

  Future<void> setPinCode(String code) async {
    try {
      await _db.put("pin_code", code);
    } catch (e) {
      print(e);
    }
  }

  String? get pinCode => _db.get("pin_code");

  bool get isFirstAppOpen => _db.get("is_first_app_open") ?? true;

  List<String> get savedMnemonics {
    try {
      List<String> res = List<String>.from(_db.get("mnemonics") ?? []);
      return res;
    } catch (e) {
      print(e);
      return [];
    }
  }

  String? get savedCurrency {
    try {
     final currencyCode =  _db.get("currency");
    return currencyCode;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
