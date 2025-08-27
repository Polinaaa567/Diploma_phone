import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/providers/navigation_provider.dart';

void main() => runApp(const ProviderScope(child: VolunteeringOrganization()));

class VolunteeringOrganization extends ConsumerWidget {
  const VolunteeringOrganization({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.lightBlue,
        useMaterial3: true,
      ),
    );
  }
}
