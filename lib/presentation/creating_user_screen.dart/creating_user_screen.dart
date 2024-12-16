import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/application/auth_bloc/auth_bloc.dart';
import 'package:ecommerce/application/auth_bloc/auth_event.dart';
import 'package:ecommerce/application/auth_bloc/auth_state.dart';
import 'package:ecommerce/application/basket_bloc/basket_bloc.dart';
import 'package:ecommerce/application/bloc/user_bloc.dart';
import 'package:ecommerce/presentation/core/router/router.dart';
import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:ecommerce/presentation/core/widgets/custom_text_field.dart';
import 'package:ecommerce/presentation/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CreatingUserScreen extends StatelessWidget {
  const CreatingUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(
              flex: 4,
            ),
            Text(
              'Sign up',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 32,
              ),
            ),
            const Spacer(),
            CustomTextField(hintText: 'Name', controller: nameController),
            const Spacer(),
            CustomTextField(hintText: 'email', controller: emailController),
            const Spacer(),
            CustomTextField(
                hintText: 'password', controller: passwordController),
            const Spacer(),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateSuccess) {
                  context.read<UserBloc>().add(
                      CreateUser(nameController.text, emailController.text));
                  context.read<BasketBloc>().add(GetAllProducts());
                  context.router.push(const HomeRoute());
                }
              },
              builder: (context, state) {
                if (state is AuthStateloading) {
                  return const CircularProgressIndicator();
                }
                return PrimaryButton(
                  buttonText: 'Sign up',
                  onTap: () {
                    context.read<AuthBloc>().add(
                          // CreateUser(nameController.text, emailController.text),
                          SignUpWithEmailAndPassword(
                            emailController.text,
                            passwordController.text,
                          ),
                        );
                  },
                );
              },
            ),
            const Spacer(
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}
