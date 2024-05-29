import 'package:click_mockup/app/utils/dialog_utils.dart';
import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/constants/images_constants.dart';
import 'package:click_mockup/constants/shadow_constants.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/account/widgets/account_app_bar.dart';
import 'package:click_mockup/features/home/widgets/sections/profile/widgets/edit_profile/edit_profile_view.dart';
import 'package:click_mockup/widgets/half_card.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: [
          AccountAppBar(
            isBack: false,
            actions: [
              AccountAppBar.iconButton(
                icon: Icons.edit,
                onTap: () {
                  Navigator.of(context).push<void>(EditProfileView.route());
                },
              ),
              AccountAppBar.iconButton(
                icon: Icons.logout_rounded,
                onTap: () async {
                  await DialogUtils.generic(
                    context,
                    image: ImagesConstants.logout,
                    title: 'Cerrar sesión',
                    subTitle: '¿Quieres cerrar tu sesión actual?',
                    textButton: 'Si, salir',
                    onConfirm: () {},
                  );
                },
              ),
            ],
            header: Center(
              child: Text(
                'Mi perfil',
                style: textTheme.titleLarge!.copyWith(
                  fontSize: 18,
                  color: ColorsConstants.grey,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                children: [
                  HalfCard(
                    width: size.width,
                    height: size.width * 0.6,
                    boxShadow: ShadowConstants.black10,
                    borderRadius: BorderRadius.circular(15),
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: Stack(
                      children: [
                        Image.asset(
                          ImagesConstants.imageProfile,
                          width: size.width,
                          height: size.width * 0.6,
                        ),
                        Positioned(
                          bottom: 10,
                          left: 15,
                          child: Text(
                            'Nombre Apellido',
                            style: textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Datos de perfil',
                    style: textTheme.titleLarge!.copyWith(
                      color: ColorsConstants.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 15),
                  item(
                    title: 'Nombre',
                    text: 'Juan',
                  ),
                  item(
                    title: 'Apellido',
                    text: 'Díaz',
                  ),
                  item(
                    title: 'DNI',
                    text: '00.000.000',
                  ),
                  item(
                    title: 'Teléfono',
                    text: '+54 4567 1234',
                  ),
                  item(
                    title: 'Correo',
                    text: 'usuario@gmail.com',
                  ),
                  const SizedBox(
                    height: 30 + kBottomNavigationBarHeight,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget item({
    required String title,
    required String text,
  }) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorsConstants.darkGrey,
                    fontSize: 14,
                  ),
            ),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorsConstants.darkGrey,
                  fontSize: 15,
                ),
          ),
        ],
      ),
    );
  }
}
