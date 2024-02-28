import 'package:coinomi/data/models/transaction.dart';
import 'package:web3dart/credentials.dart';
import 'activity.dart';


class Wallet {
  final String address;
  final String menmonicPhrase;
  final String privateKey;
  final EthereumAddress ethereumPublicAddress;
  final List<Transaction> transactions;
  final List<Activity> activities;

  Wallet({
    required this.address,
    required this.menmonicPhrase,
    required this.privateKey,
    required this.ethereumPublicAddress,
    required this.transactions,
    required this.activities,
  });

  Wallet copyWith({
    String? address,
    String? menmonicPhrase,
    String? privateKey,
    EthereumAddress? ethereumPublicAddress,
    List<Transaction>? transactions,
    List<Activity>? activities,
  }) {
    return Wallet(
      address: address ?? this.address,
      menmonicPhrase: menmonicPhrase ?? this.menmonicPhrase,
      privateKey: privateKey ?? this.privateKey,
      ethereumPublicAddress:
          ethereumPublicAddress ?? this.ethereumPublicAddress,
      transactions: transactions ?? this.transactions,
      activities: activities ?? this.activities,
    );
  }

double get countedMoneyInDollars =>
    activities.fold(0.0, (sum, activity) => sum + activity.cryptoPriceInDollars);
}
