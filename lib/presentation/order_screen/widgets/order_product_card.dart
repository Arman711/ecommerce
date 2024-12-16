import 'package:flutter/material.dart';

class OrderProductCard extends StatelessWidget {
  final String productName;
  final double price;
  const OrderProductCard(
      {super.key, required this.productName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.amber,
          ),
          child: Image.network(
            'https://s3-alpha-sig.figma.com/img/f396/4b02/293c08dbccc8996d32beb6f05e420119?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cS5RjJ~c-YybHu4~a~G~NrxCOtmkSGfWWHTehnhJ3AIrXUOWBEnXeAK~r7QXvesdN6xhJ8VYkU8ANq9ZCvjV6f3X0ydriLr3UcvssQUnVbKsP1PUHuRdywdeMP4zIgemKtUhxlV54TdsDD2193BJnrWbdMQIwM5F6jBdx02QcrEvRzGbglbcedOrqPvtcURVVnDJXeWMsEUmqsauIU68gz8mxw21QX5TkwkgBQUHxHgnbHyqTNWo~QNFI3ix4FNLTY3pdFDWRUVz4UUz2mLoqhDIMViMCzX4f9f6TW38xhOND8oJOC3XirM57aR3Al83v-yoeTN7fZTXBRI~mKqheQ__',
            width: 40,
            height: 40,
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('2packs'),
            ],
          ),
        ),
        //
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.attach_money_rounded),
              Text('$price'),
            ],
          ),
        ),
      ],
    );
  }
}
