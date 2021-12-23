import 'package:get/state_manager.dart';

class Price {
  final int id;
  final double amount;

  Price({
    required this.id,
    required this.amount,
  });

  final isFavorite = false.obs;
}
