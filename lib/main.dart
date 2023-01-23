import 'package:flutter/material.dart';
import 'package:kylashoes/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const App(),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () => [
          HeroController(createRectTween: _createRectTween),
        ],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}

RectTween _createRectTween(Rect? begin, Rect? end) {
  return MaterialRectArcTween(begin: begin, end: end);
}
