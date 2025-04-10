import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmask_app/presentation/screens/initial_screen.dart';

import './routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(380, 810),
      useInheritedMediaQuery: true,
      builder: (context, snapshot) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              devicePixelRatio: 1.0,
              textScaler: TextScaler.linear(
                  MediaQuery.of(context).textScaleFactor > 1.2
                      ? 1.2
                      : MediaQuery.of(context).textScaleFactor),
            ),
            child: MaterialApp(
              navigatorKey: Routes.router.navigatorKey,
              onGenerateRoute: Routes.router.generator(),
              debugShowCheckedModeBanner: false,
              home: InitialScreen(),
            ));
      },
    );
  }
}
