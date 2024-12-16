import 'package:auto_route/annotations.dart';
import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:ecommerce/presentation/trcking_screen/widgets/custom_dotted_line.dart';
import 'package:ecommerce/presentation/trcking_screen/widgets/delivery_status_card.dart';
import 'package:ecommerce/presentation/trcking_screen/widgets/order_recerved_card.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 32,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.chevron_left_outlined,
                  ),
                  Text(
                    'Go back',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const Text(
              'Delivery Status',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const DeliveryStatusCard(),
            const CustomDottedLine(length: 2),
            const DeliveryStatusCard(),
            const CustomDottedLine(length: 2),
            const DeliveryStatusCard(),
            const CustomDottedLine(
              length: 1,
            ),
            Image.network(
              'https://s3-alpha-sig.figma.com/img/1e1a/485f/b097de78f5a14d3b3639cec71689da9f?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KnYtmGBUDaCkTYB03kKmaSgmw5iqW7NzuR9efm1iDLh3bUnKTFaRt7Z7r~OPaSB5D3PWF9cl2so-C7sk35gb5DeXisiv3aOm3jO0jAt1JACT6d6xf4GiMCR6xm3cRqfkOSU6-Zz8TbjfAkQSWYtIcv~zSipsC~IIeFV8JFIsnUp-lYFtiosvqPJysoWGOJQvg5EgGbRSf9eusFWRUVJfJhm520ig2I1ftpyodsN8YoHJkO5YPe0oMrGBxJU9lqdLbUwyyzB~SjilKTGKLWOf8yMhn1LPVOvfGyfgo5PgTdolRbb9pZieIz8fSmZWJWVrK3afjjm-TlBSeEuSO5McsA__',
              height: 128,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const CustomDottedLine(length: 2),
            const OrderRecervedCard(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
