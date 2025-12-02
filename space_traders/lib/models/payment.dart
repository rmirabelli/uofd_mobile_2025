class Payment {
  final int onAccepted;
  final int onFulfilled;

  Payment({required this.onAccepted, required this.onFulfilled});

  factory Payment.fromJson(Map<String, dynamic> data) {
    return Payment(onAccepted: data['onAccepted'], onFulfilled: data['onFulfilled']);
  }
}
