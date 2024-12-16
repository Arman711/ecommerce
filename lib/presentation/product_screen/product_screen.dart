import 'package:auto_route/annotations.dart';
import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:ecommerce/presentation/product_screen/widgets/product_bottom_section.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final firestore = FirebaseFirestore.instance.collection('baskets');
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.chevron_left_outlined),
                  Text('Go back'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: Image.network(
                'https://s3-alpha-sig.figma.com/img/f396/4b02/293c08dbccc8996d32beb6f05e420119?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cS5RjJ~c-YybHu4~a~G~NrxCOtmkSGfWWHTehnhJ3AIrXUOWBEnXeAK~r7QXvesdN6xhJ8VYkU8ANq9ZCvjV6f3X0ydriLr3UcvssQUnVbKsP1PUHuRdywdeMP4zIgemKtUhxlV54TdsDD2193BJnrWbdMQIwM5F6jBdx02QcrEvRzGbglbcedOrqPvtcURVVnDJXeWMsEUmqsauIU68gz8mxw21QX5TkwkgBQUHxHgnbHyqTNWo~QNFI3ix4FNLTY3pdFDWRUVz4UUz2mLoqhDIMViMCzX4f9f6TW38xhOND8oJOC3XirM57aR3Al83v-yoeTN7fZTXBRI~mKqheQ__',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          const Expanded(
            flex: 7,
            child: ProductBottomSection(),
          ),
        ],
      ),
    );
  }
}
