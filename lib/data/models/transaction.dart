
class Transaction {
  final TransactionType type;
  final String fromAddress;
  final double price;
  final String currencyCode;
  final DateTime transactionDate;

  Transaction({
    required this.type,
    required this.fromAddress,
    required this.price,
    required this.currencyCode,
    required this.transactionDate,
  });

  Transaction copyWith({
    TransactionType? type,
    String? fromAddress,
    double? price,
    String? currencyCode,
    DateTime? transactionDate,
  }) {
    return Transaction(
      type: type ?? this.type,
      fromAddress: fromAddress ?? this.fromAddress,
      price: price ?? this.price,
      currencyCode: currencyCode ?? this.currencyCode,
      transactionDate: transactionDate ?? this.transactionDate,
    );
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    final typeString = map['operation_type'];
    late final TransactionType type;
    if (typeString == "send") {
      type = Send();
    } else if (typeString == "receive") {
      type = Receive();
    } else if (typeString == "trade") {
      type = Swap();
    } else {
      type = OtherType();
    }
    return Transaction(
      type: type,
      fromAddress: map['sent_from']??"no-address",
      price: map["fee"]?['price'] ??0.0,
      currencyCode: "\$",
      transactionDate: DateTime.parse(map['mined_at']),
    );
  }

  @override
  String toString() {
    return 'Transaction(type: $type, fromAddress: $fromAddress, price: $price, currencyCode: $currencyCode, transactionDate: $transactionDate)';
  }
}

abstract class TransactionType {}

class Send extends TransactionType {}

class Receive extends TransactionType {}

class Swap extends TransactionType {}

class OtherType extends TransactionType {}
