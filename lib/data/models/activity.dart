import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final String cryptoName;
  final String cryptoSymbol;
  final String? cryptoIcon;
  final double cryptoPriceInDollars;
  final double value;
  const Activity({
    required this.cryptoName,
    required this.cryptoSymbol,
    this.cryptoIcon,
    required this.cryptoPriceInDollars,
    required this.value,
  });

  Activity copyWith({
    String? cryptoName,
    String? cryptoSymbol,
    String? cryptoIcon,
    double? cryptoPriceInDollars,
    double? value,
  }) {
    return Activity(
      cryptoName: cryptoName ?? this.cryptoName,
      cryptoSymbol: cryptoSymbol ?? this.cryptoSymbol,
      cryptoIcon: cryptoIcon ?? this.cryptoIcon,
      cryptoPriceInDollars: cryptoPriceInDollars ?? this.cryptoPriceInDollars,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cryptoName': cryptoName,
      'cryptoSymbol': cryptoSymbol,
      'cryptoIcon': cryptoIcon,
      'cryptoPriceInDollars': cryptoPriceInDollars,
      'value': value,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      cryptoName: map['fungible_info']?["name"] ?? "no-name",
      cryptoSymbol: map['fungible_info']?["symbol"] ?? "no-symbol",
      cryptoIcon: map['fungible_info']?["icon"]?["url"],
      cryptoPriceInDollars: map['price'] ?? 0,
      value: map['value'] ?? 0,
    );
  }

  @override
  bool get stringify => true;

  
  double get countedPrice => cryptoPriceInDollars*value;


  @override
  List<Object?> get props {
    return [
      cryptoName,
      cryptoSymbol,
      cryptoIcon,
      cryptoPriceInDollars,
      value,
    ];
  }
}
