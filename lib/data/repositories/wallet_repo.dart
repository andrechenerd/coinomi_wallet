// ignore_for_file: avoid_print

import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:coinomi/data/apis/wallet_api.dart';
import 'package:coinomi/data/models/transaction.dart';
import 'package:hex/hex.dart';
import 'package:web3dart/credentials.dart' as web3;
import 'package:dio/dio.dart';

import '../models/activity.dart';
import '../models/wallet.dart';
import 'hive_repo.dart';

class WalletRepo {
  static final WalletRepo _instance = WalletRepo._internal();

  factory WalletRepo() {
    return _instance;
  }

  WalletRepo._internal();

  final _api = WalletAPI();
  final _hiveRepo = HiveRepo();

  Wallet? lastWallet;

  Future<Wallet> createWallet() async {
    try {
      final mnemonic = bip39.generateMnemonic();
      final res = await _api.createWallet(mnemonic);
      final data = Map<String, dynamic>.from(res.data);
      final wallet = _getWalletFromResponse(data, mnemonic);
      lastWallet = wallet;
      await _hiveRepo.saveMnemonic(mnemonic);
      return wallet;
    } on DioException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Wallet> importWallet(String mnemonic) async {
    try {
      if (mnemonic.split(" ").length != 12) {
        throw Exception("Invalid mnemonic!");
      }
      final res = await _api.importWallet(mnemonic);
      final data = Map<String, dynamic>.from(res.data);
      if (data["success"] == false) {
        throw Exception("Invalid mnemonic!");
      }
      final wallet = _getWalletFromResponse(data, mnemonic);
      lastWallet = wallet;
      print("import wallet");
      return wallet;
    } on DioException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> importLastSavedWallet() async {
    try {
      final savedMnemonics = _hiveRepo.savedMnemonics;
      if (savedMnemonics.isNotEmpty) {
        await importWallet(savedMnemonics.last);
      }
    } catch (e) {
      rethrow;
    }
  }

  Wallet _getWalletFromResponse(Map<String, dynamic> res, String mnemonic) {
    final walletAddress = res["address"];
    final transactions = List<Map<String, dynamic>>.from(res["transactions"])
        .map((e) => Transaction.fromMap(e["attributes"]))
        .toList();
    final positions = List<Map<String, dynamic>>.from(res["positions"])
        .map((e) => Activity.fromMap(e["attributes"]))
        .toList();
    final privateKey = _getPrivateKey(mnemonic);
    final address = _getPublicEthAddress(privateKey);
    final wallet = Wallet(
      address: walletAddress,
      menmonicPhrase: mnemonic,
      privateKey: privateKey,
      ethereumPublicAddress: address,
      transactions: transactions,
      activities: positions,
    );
    return wallet;
  }

  String _getPrivateKey(String mnemonic) {
    const hdPath = "m/44'/60'/0'/0/0";
    final isValidMenmonic = bip39.validateMnemonic(mnemonic);
    if (!isValidMenmonic) {
      throw Exception("Invalid mnemonic phrase!");
    }
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);
    final firstChild = root.derivePath("$hdPath/0");
    final privateKey = HEX.encode(firstChild.privateKey as List<int>);
    return privateKey;
  }

  web3.EthereumAddress _getPublicEthAddress(String privateKey) {
    final fromHex = web3.EthPrivateKey.fromHex(privateKey);
    final address = fromHex.address;
    return address;
  }
}
