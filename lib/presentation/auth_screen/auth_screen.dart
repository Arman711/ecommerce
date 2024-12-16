import 'package:auto_route/annotations.dart';

import 'package:ecommerce/presentation/auth_screen/widgets/bottom_section.dart';
import 'package:ecommerce/presentation/welcome_screen/widgets/top_tile.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: TopTile(
              imgUrl:
                  'https://s3-alpha-sig.figma.com/img/70de/1d2b/47c6f7b970c55f11642487012e865efb?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=A1kZghD0MJv4qWDwmQX4tRuXiH1NUWLDkmyv-j48PzgE1B6BnhegROs8tUvUl1komQcdYFlrl--RmXUx8nyCsJSnc9gjyKzf5tVrR7apKDRH~PnxJzV0-MPEpZWYOmLDzPSThVbp5a67T6~AIZg4nTzsy2f8bOS5dt4iPnoq-9SqlUv4KZQP6MGzVrBGvSbtxttTWbjYFA2YJ5-3xCks-pmq7EgsygNGnDh-CzpawTXW1ngLZK42XtMZUUnyOCS5x23YK5eB0AUH3kfOA70epW6I8PoPW4mQI8BxbrlvkaaYVJa1shK2bL2hZO9zRiE4YJh9dPayjAtbSd8YgL0-lA__',
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: BottomSection(),
            ),
          ),
        ],
      ),
    );
  }
}
