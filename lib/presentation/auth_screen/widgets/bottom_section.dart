import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/application/bloc/auth_bloc/auth_bloc.dart';
import 'package:ecommerce/application/bloc/auth_bloc/auth_event.dart';
import 'package:ecommerce/application/bloc/auth_bloc/auth_state.dart';
import 'package:ecommerce/application/bloc/basket_bloc/basket_bloc.dart';
import 'package:ecommerce/presentation/core/router/router.dart';
import 'package:ecommerce/presentation/core/widgets/custom_text_field.dart';
import 'package:ecommerce/presentation/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        const Text(
          'What is your firstname?',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          hintText: 'email',
          controller: emailController,
        ),
        const Spacer(),
        CustomTextField(
          hintText: 'password',
          controller: passwordController,
        ),
        const Spacer(),
        Center(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, authState) {
              if (authState is AuthStateSuccess) {
                context.read<BasketBloc>().add(GetAllProducts());
                context.router.push(const HomeRoute());
              }
            },
            builder: (context, authState) {
              if (authState is AuthStateloading) {
                return const CircularProgressIndicator();
              }
              return PrimaryButton(
                buttonText: 'Start Ordering',
                onTap: () {
                  context.read<AuthBloc>().add(
                        Login(
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                  //
                },
              );
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
