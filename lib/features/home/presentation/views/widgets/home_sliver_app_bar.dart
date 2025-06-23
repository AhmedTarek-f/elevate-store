import 'package:elevate_store/core/constants/app_text.dart';
import 'package:flutter/material.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          AppText.elevateStore,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
    );
  }
}
