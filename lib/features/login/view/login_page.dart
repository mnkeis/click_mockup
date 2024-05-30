// ignore_for_file: lines_longer_than_80_chars

import 'package:click_mockup/app/blocs/blocs.dart';
import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/constants/images_constants.dart';
import 'package:click_mockup/features/features.dart';
import 'package:click_mockup/l10n/l10n.dart';
import 'package:click_mockup/widgets/auth_layout.dart';
import 'package:click_mockup/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AuthLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.l10n.loginPageTitle,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: size.width * 0.11,
                  color: Theme.of(context).brightness == Brightness.light
                      ? ColorsConstants.pink
                      : Colors.white,
                ),
          ),
          Column(
            children: [
              Text(
                context.l10n.loginPageSocialLogin,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TODO: Replace with google signin button (round)
                  iconButton(
                    color: ColorsConstants.red,
                    icon: ImagesConstants.google,
                    onTap: () {},
                  ),
                  const SizedBox(width: 20),
                  // TODO: Replace with apple sigin button (round)
                  iconButton(
                    color: ColorsConstants.black,
                    icon: ImagesConstants.apple,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const HorizontalLine(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  context.l10n.loginScreenCredentialsLogin,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const HorizontalLine(),
            ],
          ),
          Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: context.l10n.loginScreenEmailInputLabel,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: context.l10n.loginScreenPasswordInputLabel,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_off),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        visualDensity: VisualDensity.compact,
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text(
                        context.l10n.loginScreenRememberMeCheckbox,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      fixedSize: const WidgetStatePropertyAll(
                        Size.fromHeight(35),
                      ),
                      elevation: const WidgetStatePropertyAll(0),
                      backgroundColor: WidgetStatePropertyAll(
                        ColorsConstants.red.withOpacity(0.03),
                      ),
                    ),
                    child: Text(
                      context.l10n.loginScreenRestorePasswordButton,
                    ),
                  ),
                ],
              ),
            ],
          ),
          FilledButton(
            onPressed: () {
              context.read<AuthBloc>().add(Authenticate());
            },
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                Size(size.width, 45),
              ),
              backgroundColor: const WidgetStatePropertyAll(
                ColorsConstants.pink,
              ),
            ),
            child: Text(context.l10n.loginScreenButtonLabel),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.loginScreenCreateAccountTitle,
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).push<void>(SignupPage.route()),
                child: Text(
                  context.l10n.loginScreenSignUpButtonLabel,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget iconButton({
    required String icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Image.asset(
          icon,
          height: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
