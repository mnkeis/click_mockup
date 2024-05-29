import 'package:click_mockup/app/utils/dialog_utils.dart';
import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/constants/images_constants.dart';
import 'package:click_mockup/constants/shadow_constants.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/account/widgets/account_app_bar.dart';
import 'package:click_mockup/widgets/half_card.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const EditProfileView());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AccountAppBar(
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
                  'Editar perfil',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 18,
                        color: ColorsConstants.grey,
                      ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          Positioned.fill(
                            child: ColoredBox(
                              color: Colors.black26,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImagesConstants.editPhoto,
                                    height: size.width * 0.2,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Cambia imagen de perfil',
                                    style: textTheme.titleLarge!.copyWith(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Editar datos de perfil',
                      style: textTheme.titleLarge!.copyWith(
                        color: ColorsConstants.darkGrey,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                      ),
                    ),
                    const SizedBox(height: 15),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Apellido',
                      ),
                    ),
                    const SizedBox(height: 15),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Documento',
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
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: HalfCard(
                            height: 45,
                            backgrounColor: Colors.transparent,
                            border: Border.all(),
                            isShadow: false,
                            borderRadius: BorderRadius.circular(10),
                            onTap: () => Navigator.pop(context),
                            child: Center(
                              child: Text(
                                'Cancelar',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.05),
                        Expanded(
                          child: HalfCard(
                            height: 45,
                            isShadow: false,
                            backgrounColor: ColorsConstants.green,
                            borderRadius: BorderRadius.circular(10),
                            onTap: () async {
                              await DialogUtils.confirm(
                                context,
                                title: 'Perfil actualizado correctamente',
                              );
                            },
                            child: Center(
                              child: Text(
                                'Guardar cambios',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
