import 'payment.dart';
import 'delivery.dart';

class Terms {
  final DateTime deadline;
  final Payment payment;
  final List<Delivery> deliver;

  Terms({required this.deadline, required this.payment, required this.deliver});

  factory Terms.fromJson(Map<String, dynamic> data) {
    final deliveryData = data['deliver'] as List<dynamic>;
    final deliveryMapped = deliveryData.map((e) => e as Map<String, dynamic>).toList();
    final delivery = deliveryMapped.map((e) => Delivery.fromJson(e)).toList();
    return Terms(
      deadline: DateTime.parse(data['deadline']),
      payment: Payment.fromJson(data['payment']),
      deliver: delivery,
    );
  }
}
