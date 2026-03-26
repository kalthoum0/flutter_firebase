import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_attempt/core/extensions/router/router.gr.dart';
import 'package:second_attempt/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:second_attempt/l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (_, state) => state is AuthUnauthenticated,
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          context.router.replaceAll([const StartupPageRoute()]);
        }
      },
      builder: (context, state) {
        if (state is AuthSuccess) {
          final userName = state.user.displayName ?? "User";
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(widget.title),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LogOutRequested());
                  },
                  icon: Icon(
                    Icons.exit_to_app_rounded,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Wellcome $userName'),
                  Text(l10n.emailLabel),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
