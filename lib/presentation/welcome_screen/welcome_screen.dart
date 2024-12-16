import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/presentation/core/router/router.dart';
import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:ecommerce/presentation/welcome_screen/widgets/bottom_tile.dart';
import 'package:ecommerce/presentation/welcome_screen/widgets/top_tile.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopTile(
            imgUrl:
                'https://s3-alpha-sig.figma.com/img/edcf/8e89/db5451b875a74a87c96f0f40d451c9df?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CyiGQR1-b5LrJ8IHNrWmShMGengcDhB-jzlp8e2E4XMkcqjoCS77sB5jftyXzv329hV316s~8XpP0CpGdJwCTcyQAT9JWgrSf9HPGngwr~u8PG3L-Uq9fz6bozOxEv92GocR7fPSO6FPSlhgdu4EKJpmHVrONiUte07Qhr37hQje4lhAc5h6GhUcwgQUr7Nl1WhkHHBVOa527sheRKv20ZrTjp2JWSDch0AaRryxge27J7GHmkueK2bjgycVCWscRhdVSzEt37cA0b6lAii5hVCzhSvgeM98JDdrm8enQLlvWjIGRsWUkMGPsKP5hNMKjinhDKpTreTZ6qLoDGRKSA__',
          ),
          const BottomTile(),
          TextButton(
            onPressed: () {
              context.router.push(
                const CreatingUserRoute(),
              );
            },
            child: Text(
              'Sign up',
              style: TextStyle(color: AppColors.primaryColor, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
