// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class ExchangeRatesRepo {
  static final ExchangeRatesRepo _instance = ExchangeRatesRepo._internal();

  factory ExchangeRatesRepo() {
    return _instance;
  }

  ExchangeRatesRepo._internal();

  Map _rates = {};
  DateTime? lastUpdate;

  Future<void> manuallySetRates() async {
    await _setRates();
  }

  Timer? _timer;

  void startRateUpdateTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 5), (timer) async {
      await _setRates();
    });
  }

  Future<void> _setRates() async {
    try {
      final dio = Dio();
      final resp = await dio.get("http://www.convertmymoney.com/rates.json");
      final data = jsonDecode(resp.data);
      final   Map<dynamic,dynamic> rates = Map.from(data["rates"]);
         final Map<String, double> doubleRates = {};
      for(final i in rates.entries){
              final key = i.key;
      final value = i.value;
      doubleRates.addAll({key:value/1});
      print(doubleRates);
      }
      _rates=doubleRates;
     
      lastUpdate =
          DateTime.fromMillisecondsSinceEpoch(data["timestamp"] * 1000);
    } catch (e) {
      print(e);
    }
  }

  List<Currency> get currencies => [
        Currency(symbol: 'DZD', rate: _rates['DZD']),
        Currency(symbol: 'NAD', rate: _rates['NAD']),
        Currency(symbol: 'GHS', rate: _rates['GHS']),
        Currency(symbol: 'EGP', rate: _rates['EGP']),
        Currency(symbol: 'BGN', rate: _rates['BGN']),
        Currency(symbol: 'XCD', rate: _rates['XCD']),
        Currency(symbol: 'PAB', rate: _rates['PAB']),
        Currency(symbol: 'BOB', rate: _rates['BOB']),
        Currency(symbol: 'DKK', rate: _rates['DKK']),
        Currency(symbol: 'BWP', rate: _rates['BWP']),
        Currency(symbol: 'LBP', rate: _rates['LBP']),
        Currency(symbol: 'TZS', rate: _rates['TZS']),
        Currency(symbol: 'VND', rate: _rates['VND']),
        Currency(symbol: 'AOA', rate: _rates['AOA']),
        Currency(symbol: 'KHR', rate: _rates['KHR']),
        Currency(symbol: 'MYR', rate: _rates['MYR']),
        Currency(symbol: 'KYD', rate: _rates['KYD']),
        Currency(symbol: 'LYD', rate: _rates['LYD']),
        Currency(symbol: 'UAH', rate: _rates['UAH']),
        Currency(symbol: 'JOD', rate: _rates['JOD']),
        Currency(symbol: 'AWG', rate: _rates['AWG']),
        Currency(symbol: 'SAR', rate: _rates['SAR']),
        Currency(symbol: 'XAG', rate: _rates['XAG']),
        Currency(symbol: 'HKD', rate: _rates['HKD']),
        Currency(symbol: 'CHF', rate: _rates['CHF']),
        Currency(symbol: 'GIP', rate: _rates['GIP']),
        Currency(symbol: 'MRU', rate: _rates['MRU']),
        Currency(symbol: 'ALL', rate: _rates['ALL']),
        Currency(symbol: 'XPD', rate: _rates['XPD']),
        Currency(symbol: 'BYN', rate: _rates['BYN']),
        Currency(symbol: 'HRK', rate: _rates['HRK']),
        Currency(symbol: 'DJF', rate: _rates['DJF']),
        Currency(symbol: 'SZL', rate: _rates['SZL']),
        Currency(symbol: 'THB', rate: _rates['THB']),
        Currency(symbol: 'XAF', rate: _rates['XAF']),
        Currency(symbol: 'BND', rate: _rates['BND']),
        Currency(symbol: 'ISK', rate: _rates['ISK']),
        Currency(symbol: 'UYU', rate: _rates['UYU']),
        Currency(symbol: 'NIO', rate: _rates['NIO']),
        Currency(symbol: 'LAK', rate: _rates['LAK']),
        Currency(symbol: 'SYP', rate: _rates['SYP']),
        Currency(symbol: 'MAD', rate: _rates['MAD']),
        Currency(symbol: 'MZN', rate: _rates['MZN']),
        Currency(symbol: 'PHP', rate: _rates['PHP']),
        Currency(symbol: 'ZAR', rate: _rates['ZAR']),
        Currency(symbol: 'NPR', rate: _rates['NPR']),
        Currency(symbol: 'ZWL', rate: _rates['ZWL']),
        Currency(symbol: 'NGN', rate: _rates['NGN']),
        Currency(symbol: 'CRC', rate: _rates['CRC']),
        Currency(symbol: 'AED', rate: _rates['AED']),
        Currency(symbol: 'GBP', rate: _rates['GBP']),
        Currency(symbol: 'MWK', rate: _rates['MWK']),
        Currency(symbol: 'LKR', rate: _rates['LKR']),
        Currency(symbol: 'PKR', rate: _rates['PKR']),
        Currency(symbol: 'HUF', rate: _rates['HUF']),
        Currency(symbol: 'BMD', rate: _rates['BMD']),
        Currency(symbol: 'LSL', rate: _rates['LSL']),
        Currency(symbol: 'MNT', rate: _rates['MNT']),
        Currency(symbol: 'AMD', rate: _rates['AMD']),
        Currency(symbol: 'UGX', rate: _rates['UGX']),
        Currency(symbol: 'QAR', rate: _rates['QAR']),
        Currency(symbol: 'XDR', rate: _rates['XDR']),
        Currency(symbol: 'STN', rate: _rates['STN']),
        Currency(symbol: 'JMD', rate: _rates['JMD']),
        Currency(symbol: 'GEL', rate: _rates['GEL']),
        Currency(symbol: 'SHP', rate: _rates['SHP']),
        Currency(symbol: 'AFN', rate: _rates['AFN']),
        Currency(symbol: 'SBD', rate: _rates['SBD']),
        Currency(symbol: 'KPW', rate: _rates['KPW']),
        Currency(symbol: 'TRY', rate: _rates['TRY']),
        Currency(symbol: 'BDT', rate: _rates['BDT']),
        Currency(symbol: 'YER', rate: _rates['YER']),
        Currency(symbol: 'HTG', rate: _rates['HTG']),
        Currency(symbol: 'XOF', rate: _rates['XOF']),
        Currency(symbol: 'MGA', rate: _rates['MGA']),
        Currency(symbol: 'ANG', rate: _rates['ANG']),
        Currency(symbol: 'LRD', rate: _rates['LRD']),
        Currency(symbol: 'RWF', rate: _rates['RWF']),
        Currency(symbol: 'NOK', rate: _rates['NOK']),
        Currency(symbol: 'MOP', rate: _rates['MOP']),
        Currency(symbol: 'SSP', rate: _rates['SSP']),
        Currency(symbol: 'INR', rate: _rates['INR']),
        Currency(symbol: 'MXN', rate: _rates['MXN']),
        Currency(symbol: 'CZK', rate: _rates['CZK']),
        Currency(symbol: 'TJS', rate: _rates['TJS']),
        Currency(symbol: 'BTC', rate: _rates['BTC']),
        Currency(symbol: 'BTN', rate: _rates['BTN']),
        Currency(symbol: 'COP', rate: _rates['COP']),
        Currency(symbol: 'TMT', rate: _rates['TMT']),
        Currency(symbol: 'MUR', rate: _rates['MUR']),
        Currency(symbol: 'IDR', rate: _rates['IDR']),
        Currency(symbol: 'HNL', rate: _rates['HNL']),
        Currency(symbol: 'XPF', rate: _rates['XPF']),
        Currency(symbol: 'FJD', rate: _rates['FJD']),
        Currency(symbol: 'ETB', rate: _rates['ETB']),
        Currency(symbol: 'PEN', rate: _rates['PEN']),
        Currency(symbol: 'BZD', rate: _rates['BZD']),
        Currency(symbol: 'ILS', rate: _rates['ILS']),
        Currency(symbol: 'DOP', rate: _rates['DOP']),
        Currency(symbol: 'GGP', rate: _rates['GGP']),
        Currency(symbol: 'MDL', rate: _rates['MDL']),
        Currency(symbol: 'XPT', rate: _rates['XPT']),
        Currency(symbol: 'BSD', rate: _rates['BSD']),
        Currency(symbol: 'SEK', rate: _rates['SEK']),
        Currency(symbol: 'JEP', rate: _rates['JEP']),
        Currency(symbol: 'AUD', rate: _rates['AUD']),
        Currency(symbol: 'SRD', rate: _rates['SRD']),
        Currency(symbol: 'CUP', rate: _rates['CUP']),
        Currency(symbol: 'CLF', rate: _rates['CLF']),
        Currency(symbol: 'BBD', rate: _rates['BBD']),
        Currency(symbol: 'KMF', rate: _rates['KMF']),
        Currency(symbol: 'KRW', rate: _rates['KRW']),
        Currency(symbol: 'GMD', rate: _rates['GMD']),
        Currency(symbol: 'IMP', rate: _rates['IMP']),
        Currency(symbol: 'CUC', rate: _rates['CUC']),
        Currency(symbol: 'CLP', rate: _rates['CLP']),
        Currency(symbol: 'ZMW', rate: _rates['ZMW']),
        Currency(symbol: 'EUR', rate: _rates['EUR']),
        Currency(symbol: 'CDF', rate: _rates['CDF']),
        Currency(symbol: 'VES', rate: _rates['VES']),
        Currency(symbol: 'KZT', rate: _rates['KZT']),
        Currency(symbol: 'RUB', rate: _rates['RUB']),
        Currency(symbol: 'TTD', rate: _rates['TTD']),
        Currency(symbol: 'OMR', rate: _rates['OMR']),
        Currency(symbol: 'BRL', rate: _rates['BRL']),
        Currency(symbol: 'MMK', rate: _rates['MMK']),
        Currency(symbol: 'PLN', rate: _rates['PLN']),
        Currency(symbol: 'PYG', rate: _rates['PYG']),
        Currency(symbol: 'KES', rate: _rates['KES']),
        Currency(symbol: 'SVC', rate: _rates['SVC']),
        Currency(symbol: 'MKD', rate: _rates['MKD']),
        Currency(symbol: 'AZN', rate: _rates['AZN']),
        Currency(symbol: 'TOP', rate: _rates['TOP']),
        Currency(symbol: 'MVR', rate: _rates['MVR']),
        Currency(symbol: 'VUV', rate: _rates['VUV']),
        Currency(symbol: 'GNF', rate: _rates['GNF']),
        Currency(symbol: 'WST', rate: _rates['WST']),
        Currency(symbol: 'IQD', rate: _rates['IQD']),
        Currency(symbol: 'ERN', rate: _rates['ERN']),
        Currency(symbol: 'BAM', rate: _rates['BAM']),
        Currency(symbol: 'SCR', rate: _rates['SCR']),
        Currency(symbol: 'CAD', rate: _rates['CAD']),
        Currency(symbol: 'CVE', rate: _rates['CVE']),
        Currency(symbol: 'KWD', rate: _rates['KWD']),
        Currency(symbol: 'BIF', rate: _rates['BIF']),
        Currency(symbol: 'PGK', rate: _rates['PGK']),
        Currency(symbol: 'SOS', rate: _rates['SOS']),
        Currency(symbol: 'TWD', rate: _rates['TWD']),
        Currency(symbol: 'SGD', rate: _rates['SGD']),
        Currency(symbol: 'UZS', rate: _rates['UZS']),
        Currency(symbol: 'STD', rate: _rates['STD']),
        Currency(symbol: 'IRR', rate: _rates['IRR']),
        Currency(symbol: 'CNY', rate: _rates['CNY']),
        Currency(symbol: 'SLL', rate: _rates['SLL']),
        Currency(symbol: 'TND', rate: _rates['TND']),
        Currency(symbol: 'GYD', rate: _rates['GYD']),
        Currency(symbol: 'NZD', rate: _rates['NZD']),
        Currency(symbol: 'FKP', rate: _rates['FKP']),
        Currency(symbol: 'USD', rate: _rates['USD']),
        Currency(symbol: 'CNH', rate: _rates['CNH']),
        Currency(symbol: 'KGS', rate: _rates['KGS']),
        Currency(symbol: 'ARS', rate: _rates['ARS']),
        Currency(symbol: 'RON', rate: _rates['RON']),
        Currency(symbol: 'GTQ', rate: _rates['GTQ']),
        Currency(symbol: 'RSD', rate: _rates['RSD']),
        Currency(symbol: 'BHD', rate: _rates['BHD']),
        Currency(symbol: 'JPY', rate: _rates['JPY']),
        Currency(symbol: 'SDG', rate: _rates['SDG']),
        Currency(symbol: 'XAU', rate: _rates['XAU']),
      ];

  double get DZD => _rates["DZD"] ?? 0.00001;
  double get NAD => _rates["NAD"] ?? 0.00001;
  double get GHS => _rates["GHS"] ?? 0.00001;
  double get EGP => _rates["EGP"] ?? 0.00001;
  double get BGN => _rates["BGN"] ?? 0.00001;
  double get XCD => _rates["XCD"] ?? 0.00001;
  double get PAB => _rates["PAB"] ?? 0.00001;
  double get BOB => _rates["BOB"] ?? 0.00001;
  double get DKK => _rates["DKK"] ?? 0.00001;
  double get BWP => _rates["BWP"] ?? 0.00001;
  double get LBP => _rates["LBP"] ?? 0.00001;
  double get TZS => _rates["TZS"] ?? 0.00001;
  double get VND => _rates["VND"] ?? 0.00001;
  double get AOA => _rates["AOA"] ?? 0.00001;
  double get KHR => _rates["KHR"] ?? 0.00001;
  double get MYR => _rates["MYR"] ?? 0.00001;
  double get KYD => _rates["KYD"] ?? 0.00001;
  double get LYD => _rates["LYD"] ?? 0.00001;
  double get UAH => _rates["UAH"] ?? 0.00001;
  double get JOD => _rates["JOD"] ?? 0.00001;
  double get AWG => _rates["AWG"] ?? 0.00001;
  double get SAR => _rates["SAR"] ?? 0.00001;
  double get XAG => _rates["XAG"] ?? 0.00001;
  double get HKD => _rates["HKD"] ?? 0.00001;
  double get CHF => _rates["CHF"] ?? 0.00001;
  double get GIP => _rates["GIP"] ?? 0.00001;
  double get MRU => _rates["MRU"] ?? 0.00001;
  double get ALL => _rates["ALL"] ?? 0.00001;
  double get XPD => _rates["XPD"] ?? 0.00001;
  double get BYN => _rates["BYN"] ?? 0.00001;
  double get HRK => _rates["HRK"] ?? 0.00001;
  double get DJF => _rates["DJF"] ?? 0.00001;
  double get SZL => _rates["SZL"] ?? 0.00001;
  double get THB => _rates["THB"] ?? 0.00001;
  double get XAF => _rates["XAF"] ?? 0.00001;
  double get BND => _rates["BND"] ?? 0.00001;
  double get ISK => _rates["ISK"] ?? 0.00001;
  double get UYU => _rates["UYU"] ?? 0.00001;
  double get NIO => _rates["NIO"] ?? 0.00001;
  double get LAK => _rates["LAK"] ?? 0.00001;
  double get SYP => _rates["SYP"] ?? 0.00001;
  double get MAD => _rates["MAD"] ?? 0.00001;
  double get MZN => _rates["MZN"] ?? 0.00001;
  double get PHP => _rates["PHP"] ?? 0.00001;
  double get ZAR => _rates["ZAR"] ?? 0.00001;
  double get NPR => _rates["NPR"] ?? 0.00001;
  double get ZWL => _rates["ZWL"] ?? 0.00001;
  double get NGN => _rates["NGN"] ?? 0.00001;
  double get CRC => _rates["CRC"] ?? 0.00001;
  double get AED => _rates["AED"] ?? 0.00001;
  double get GBP => _rates["GBP"] ?? 0.00001;
  double get MWK => _rates["MWK"] ?? 0.00001;
  double get LKR => _rates["LKR"] ?? 0.00001;
  double get PKR => _rates["PKR"] ?? 0.00001;
  double get HUF => _rates["HUF"] ?? 0.00001;
  double get BMD => _rates["BMD"] ?? 0.00001;
  double get LSL => _rates["LSL"] ?? 0.00001;
  double get MNT => _rates["MNT"] ?? 0.00001;
  double get AMD => _rates["AMD"] ?? 0.00001;
  double get UGX => _rates["UGX"] ?? 0.00001;
  double get QAR => _rates["QAR"] ?? 0.00001;
  double get XDR => _rates["XDR"] ?? 0.00001;
  double get STN => _rates["STN"] ?? 0.00001;
  double get JMD => _rates["JMD"] ?? 0.00001;
  double get GEL => _rates["GEL"] ?? 0.00001;
  double get SHP => _rates["SHP"] ?? 0.00001;
  double get AFN => _rates["AFN"] ?? 0.00001;
  double get SBD => _rates["SBD"] ?? 0.00001;
  double get KPW => _rates["KPW"] ?? 0.00001;
  double get TRY => _rates["TRY"] ?? 0.00001;
  double get BDT => _rates["BDT"] ?? 0.00001;
  double get YER => _rates["YER"] ?? 0.00001;
  double get HTG => _rates["HTG"] ?? 0.00001;
  double get XOF => _rates["XOF"] ?? 0.00001;
  double get MGA => _rates["MGA"] ?? 0.00001;
  double get ANG => _rates["ANG"] ?? 0.00001;
  double get LRD => _rates["LRD"] ?? 0.00001;
  double get RWF => _rates["RWF"] ?? 0.00001;
  double get NOK => _rates["NOK"] ?? 0.00001;
  double get MOP => _rates["MOP"] ?? 0.00001;
  double get SSP => _rates["SSP"] ?? 0.00001;
  double get INR => _rates["INR"] ?? 0.00001;
  double get MXN => _rates["MXN"] ?? 0.00001;
  double get CZK => _rates["CZK"] ?? 0.00001;
  double get TJS => _rates["TJS"] ?? 0.00001;
  double get BTC => _rates["BTC"] ?? 0.00001;
  double get BTN => _rates["BTN"] ?? 0.00001;
  double get COP => _rates["COP"] ?? 0.00001;
  double get TMT => _rates["TMT"] ?? 0.00001;
  double get MUR => _rates["MUR"] ?? 0.00001;
  double get IDR => _rates["IDR"] ?? 0.00001;
  double get HNL => _rates["HNL"] ?? 0.00001;
  double get XPF => _rates["XPF"] ?? 0.00001;
  double get FJD => _rates["FJD"] ?? 0.00001;
  double get ETB => _rates["ETB"] ?? 0.00001;
  double get PEN => _rates["PEN"] ?? 0.00001;
  double get BZD => _rates["BZD"] ?? 0.00001;
  double get ILS => _rates["ILS"] ?? 0.00001;
  double get DOP => _rates["DOP"] ?? 0.00001;
  double get GGP => _rates["GGP"] ?? 0.00001;
  double get MDL => _rates["MDL"] ?? 0.00001;
  double get XPT => _rates["XPT"] ?? 0.00001;
  double get BSD => _rates["BSD"] ?? 0.00001;
  double get SEK => _rates["SEK"] ?? 0.00001;
  double get JEP => _rates["JEP"] ?? 0.00001;
  double get AUD => _rates["AUD"] ?? 0.00001;
  double get SRD => _rates["SRD"] ?? 0.00001;
  double get CUP => _rates["CUP"] ?? 0.00001;
  double get CLF => _rates["CLF"] ?? 0.00001;
  double get BBD => _rates["BBD"] ?? 0.00001;
  double get KMF => _rates["KMF"] ?? 0.00001;
  double get KRW => _rates["KRW"] ?? 0.00001;
  double get GMD => _rates["GMD"] ?? 0.00001;
  double get IMP => _rates["IMP"] ?? 0.00001;
  double get CUC => _rates["CUC"] ?? 0.00001;
  double get CLP => _rates["CLP"] ?? 0.00001;
  double get ZMW => _rates["ZMW"] ?? 0.00001;
  double get EUR => _rates["EUR"] ?? 0.00001;
  double get CDF => _rates["CDF"] ?? 0.00001;
  double get VES => _rates["VES"] ?? 0.00001;
  double get KZT => _rates["KZT"] ?? 0.00001;
  double get RUB => _rates["RUB"] ?? 0.00001;
  double get TTD => _rates["TTD"] ?? 0.00001;
  double get OMR => _rates["OMR"] ?? 0.00001;
  double get BRL => _rates["BRL"] ?? 0.00001;
  double get MMK => _rates["MMK"] ?? 0.00001;
  double get PLN => _rates["PLN"] ?? 0.00001;
  double get PYG => _rates["PYG"] ?? 0.00001;
  double get KES => _rates["KES"] ?? 0.00001;
  double get SVC => _rates["SVC"] ?? 0.00001;
  double get MKD => _rates["MKD"] ?? 0.00001;
  double get AZN => _rates["AZN"] ?? 0.00001;
  double get TOP => _rates["TOP"] ?? 0.00001;
  double get MVR => _rates["MVR"] ?? 0.00001;
  double get VUV => _rates["VUV"] ?? 0.00001;
  double get GNF => _rates["GNF"] ?? 0.00001;
  double get WST => _rates["WST"] ?? 0.00001;
  double get IQD => _rates["IQD"] ?? 0.00001;
  double get ERN => _rates["ERN"] ?? 0.00001;
  double get BAM => _rates["BAM"] ?? 0.00001;
  double get SCR => _rates["SCR"] ?? 0.00001;
  double get CAD => _rates["CAD"] ?? 0.00001;
  double get CVE => _rates["CVE"] ?? 0.00001;
  double get KWD => _rates["KWD"] ?? 0.00001;
  double get BIF => _rates["BIF"] ?? 0.00001;
  double get PGK => _rates["PGK"] ?? 0.00001;
  double get SOS => _rates["SOS"] ?? 0.00001;
  double get TWD => _rates["TWD"] ?? 0.00001;
  double get SGD => _rates["SGD"] ?? 0.00001;
  double get UZS => _rates["UZS"] ?? 0.00001;
  double get STD => _rates["STD"] ?? 0.00001;
  double get IRR => _rates["IRR"] ?? 0.00001;
  double get CNY => _rates["CNY"] ?? 0.00001;
  double get SLL => _rates["SLL"] ?? 0.00001;
  double get TND => _rates["TND"] ?? 0.00001;
  double get GYD => _rates["GYD"] ?? 0.00001;
  double get NZD => _rates["NZD"] ?? 0.00001;
  double get FKP => _rates["FKP"] ?? 0.00001;
  double get USD => _rates["USD"] ?? 0.00001;
  double get CNH => _rates["CNH"] ?? 0.00001;
  double get KGS => _rates["KGS"] ?? 0.00001;
  double get ARS => _rates["ARS"] ?? 0.00001;
  double get RON => _rates["RON"] ?? 0.00001;
  double get GTQ => _rates["GTQ"] ?? 0.00001;
  double get RSD => _rates["RSD"] ?? 0.00001;
  double get BHD => _rates["BHD"] ?? 0.00001;
  double get JPY => _rates["JPY"] ?? 0.00001;
  double get SDG => _rates["SDG"] ?? 0.00001;
  double get XAU => _rates["XAU"] ?? 0.00001;  
}

class Currency extends Equatable {
  final String symbol;
  final double rate;
  const Currency({
    required this.symbol,
    required this.rate,
  });

  @override
  List<Object> get props => [symbol, rate];
}
