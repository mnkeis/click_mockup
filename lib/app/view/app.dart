import 'package:click_mockup/app/blocs/blocs.dart';
import 'package:click_mockup/app/dark_theme.dart';
import 'package:click_mockup/app/routes/routes.dart';
import 'package:click_mockup/app/theme.dart';
import 'package:click_mockup/l10n/l10n.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const seedColor = Color(0xFFE6244F);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ThemeModeCubit()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(seedColor),
          darkTheme: darkTheme(seedColor),
          themeMode: ThemeMode.light, // themeMode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: FlowBuilder<AuthState>(
            state: context.select((AuthBloc bloc) => bloc.state),
            onGeneratePages: onGenerateAppPages,
          ),
        );
      },
    );
  }
}
