import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/constants/images_constants.dart';
import 'package:click_mockup/l10n/l10n.dart';
import 'package:click_mockup/widgets/auth_layout.dart';
import 'package:click_mockup/widgets/horizontal_line.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignupPage());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AuthLayout(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Register',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: size.width * 0.11,
                  ),
            ),
            const SizedBox(height: 20),
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
                    iconButton(
                      color: ColorsConstants.red,
                      icon: ImagesConstants.google,
                      onTap: () {},
                    ),
                    const SizedBox(width: 20),
                    iconButton(
                      color: ColorsConstants.black,
                      icon: ImagesConstants.apple,
                      onTap: () {},
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
                        vertical: 20,
                      ),
                      child: Text(
                        'O ingresa usando tu datos',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const HorizontalLine(),
                  ],
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Nombre y Apellido',
                  ),
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Teléfono',
                  ),
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Correo',
                  ),
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                  ),
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Repetir contraseña',
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(
                      Size(size.width, 45),
                    ),
                    backgroundColor: const WidgetStatePropertyAll(
                      ColorsConstants.pink,
                    ),
                  ),
                  child: Text(
                    'Registrarme',
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '¿Ya tienes tu cuenta?',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push<void>(SignupPage.route());
                      },
                      child: Text(
                        'Inicia sesión',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
