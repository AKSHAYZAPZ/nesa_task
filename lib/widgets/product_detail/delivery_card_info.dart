import 'package:flutter/material.dart';

class DeliveryInfoCard extends StatelessWidget {
  const DeliveryInfoCard({super.key, required this.shippingInfo});
  final String shippingInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(Icons.local_shipping_outlined),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shippingInfo,
                    style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Text('1 item is in the way',
                    style: TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
          Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
