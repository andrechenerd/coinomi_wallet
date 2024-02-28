import 'dart:io';

import 'package:coinomi/data/repositories/exchange_rates_repo.dart';
import 'package:coinomi/data/repositories/hive_repo.dart';
import 'package:coinomi/data/repositories/wallet_repo.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'app/coinomi_app.dart';

void main() async {
  if (Platform.isLinux) {
    setWindowTitle('Coinomi Wallet');
    setWindowMaxSize(const Size(1920, 1080));
    setWindowMinSize(const Size(1029, 700));
  }
  WidgetsFlutterBinding.ensureInitialized();
  await HiveRepo().init();
  await WalletRepo().importLastSavedWallet();
  ExchangeRatesRepo().manuallySetRates().then((value) {
    ExchangeRatesRepo().startRateUpdateTimer();
  });
  runApp(const CoinomiApp());
}
