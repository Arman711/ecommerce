import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/application/auth_bloc/auth_bloc.dart';
import 'package:ecommerce/application/bloc/user_bloc.dart';
import 'package:ecommerce/presentation/auth_screen/widgets/bottom_section.dart';
import 'package:ecommerce/presentation/core/router/router.dart';
import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:ecommerce/presentation/order_screen/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).viewPadding.top,
        horizontal: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            size: 40,
          ),
          IconButton(
            onPressed: () {
              context.read<UserBloc>().add(GetFavoriteProducts());
              context.router.push(const OrderRoute());
            },
            icon: Icon(
              Icons.shopping_bag_rounded,
              size: 40,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
