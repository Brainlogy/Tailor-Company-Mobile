import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/status_button.dart';

enum Status { newOrder, pendingOrder }

class ProductStatus extends StatelessWidget {
  final Status status;
  final void Function(Status status) onStatusChange;
  const ProductStatus({
    required this.status,
    required this.onStatusChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatusButton(
          label: StringConstants.newRequest,
          isActive: status == Status.newOrder,
          onTap: () => onStatusChange(Status.newOrder),
        ),
        const SizedBox(width: 8),
        StatusButton(
          label: StringConstants.pendingOrders,
          isActive: status == Status.pendingOrder,
          onTap: () => onStatusChange(Status.pendingOrder),
        )
      ],
    );
  }
}
