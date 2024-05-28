import 'package:click_mockup/app/blocs/blocs.dart';
import 'package:click_mockup/features/features.dart';
import 'package:click_mockup/l10n/l10n.dart';
import 'package:click_mockup/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Image(
                    width: MediaQuery.of(context).size.width * 0.4,
                    image: const NetworkImage(
                      'http://ntdns.host/logos/logo_click_2021_2.png',
                    ),
                  ),
                ),
                Expanded(
                  child: HalfCard(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 30),
                              Align(
                                child: Text(
                                  context.l10n.loginPageTitle,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Align(
                                child: Text(
                                  context.l10n.loginPageSocialLogin,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // TODO: Replace with google signin button (round)
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.android),
                                  ),
                                  // TODO: Replace with apple sigin button (round)
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.apple),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const HorizontalLine(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      context.l10n.loginScreenCredentialsLogin,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  const HorizontalLine(),
                                ],
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText:
                                      context.l10n.loginScreenEmailInputLabel,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: context
                                      .l10n.loginScreenPasswordInputLabel,
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.visibility_off),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        visualDensity: VisualDensity.compact,
                                        value: false,
                                        onChanged: (value) {},
                                      ),
                                      Text(
                                        context
                                            .l10n.loginScreenRememberMeCheckbox,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      context.l10n
                                          .loginScreenRestorePasswordButton,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              FilledButton(
                                onPressed: () => context
                                    .read<AuthBloc>()
                                    .add(Authenticate()),
                                child:
                                    Text(context.l10n.loginScreenButtonLabel),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  context.l10n.loginScreenCreateAccountTitle,
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context)
                                      .push<void>(SignupPage.route()),
                                  child: Text(
                                    context.l10n.loginScreenSignUpButtonLabel,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
