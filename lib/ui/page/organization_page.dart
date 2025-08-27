import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:volunteering_kemsu/core/providers/organization_provider.dart';

class OrganizationInfo extends ConsumerWidget {
  const OrganizationInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infoOrganization = ref.watch(organizationProvider.select(
      (state) => state.info,
    ));

    return infoOrganization.when(
      error: (err, stack) => Center(
        child: Text('Ошибка: $err'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (info) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(15.0),
                      topLeft: const Radius.circular(15.0),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment(0.95, 1),
                      colors: <Color>[
                        Color.fromARGB(200, 25, 96, 184),
                        Color.fromARGB(169, 0, 101, 255),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () => context.pop(),
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${info.name}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 15),
                      Image.network(
                        'http://192.168.1.34:8080/volunteeringKEMSU/api/images/storage?fileName=${info.image}',
                        height: 220,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            'https://sun9-13.userapi.com/impf/wp_ckCPuXV7M7xbC_g3lVtpc2BgQhYx-9ZmeMQ/yor2PcNjubE.jpg?size=1920x768&quality=95&crop=0,0,1920,767&sign=53350d02d37dada715aca1519472dffd&type=cover_group',
                            height: 125,
                            fit: BoxFit.cover,
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            height: 220,
                            color: Colors.grey,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "${info.description?.replaceAll(r"\n", "\n\n")}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black.withAlpha(150),
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    '${info.address}',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final String rawLink = info.contacts ?? '';
                        final Uri uri = Uri.parse(rawLink);
                        await launchUrl(
                          uri,
                          mode: LaunchMode.externalNonBrowserApplication,
                        );
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.vk,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
