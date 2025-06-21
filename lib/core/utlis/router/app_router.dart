import 'package:elevate_store/core/utlis/router/route_names.dart';
import 'package:elevate_store/features/home/presentation/views/home_view.dart';
import 'package:elevate_store/features/home/presentation/views_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.home: (_) => BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    ),
  };
}
