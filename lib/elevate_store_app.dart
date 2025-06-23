import 'package:elevate_store/core/utlis/app_theme.dart';
import 'package:elevate_store/core/utlis/router/app_router.dart';
import 'package:elevate_store/core/utlis/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevateStoreApp extends StatelessWidget {
  const ElevateStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72, 856.72),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Elevate Store',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routes: AppRouter.routes,
        initialRoute: RouteNames.home,
      ),
    );
  }
}
