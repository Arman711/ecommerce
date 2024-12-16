import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:flutter/material.dart';

class DeliveryStatusCard extends StatelessWidget {
  const DeliveryStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xfffffaeb),
            ),
            child: Image.network(
              'https://s3-alpha-sig.figma.com/img/6a31/d1ee/829d3bd571108902b4fb13ff34fea447?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lw7URnaYxz3oBStquK6Hlg2vq1i2q-b3qVtKOyvXuSb9dpaG~lVmiJjb5eD0HBQtnjWyUVW5GwUnMN-KNWDXbdwNBmDoSI74tgNhL6FJAE32nDOATUA3am2nLtFjLCQlwtOYEGgHu7XphBCmWMKVzlBuQWytD3iQzvoYrqoSjW2g0VJnY4yPhYXSqbF0ieXW9TyfbytFrv~NXRxfxlQO3LARL2FBOOlD2Q3i6cBbDjcMXzhjNpsYhJfH6Yme7OwEo8lIiCPdbeu6IsqXStEgB8q7uZMgeUr6OdONzDqCKyHxn~Uqr0z81F07t-MX71gEBqRZR4vJeTmogy3FvfP6DA__',
              height: 48,
              width: 48,
              // fit: BoxFit.cover,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          const Text('Order Taken'),
          const Spacer(
            flex: 6,
          ),
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.successBorderColor,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 10,
            ),
          ),
        ],
      ),
    );
  }
}
