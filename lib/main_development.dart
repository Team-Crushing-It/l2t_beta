import 'package:l2t_beta/authentication_flow/authentication_flow.dart';
import 'package:l2t_beta/location_flow/location_flow.dart';
import 'package:l2t_beta/about_flow/about_flow.dart';
import 'package:l2t_beta/profile_flow/profile_flow.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp(locationRepository: LocationRepository()));

class MyApp extends StatelessWidget {
  MyApp({Key? key, required LocationRepository locationRepository})
      : _locationRepository = locationRepository,
        super(key: key);

  final LocationRepository _locationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _locationRepository,
      child: MaterialApp(home: Home()),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(100.0),
            child: Text('text'),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text('Onboarding Flow'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    await Navigator.of(context).push(AboutFlow.route());
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Onboarding Flow Complete!'),
                        ),
                      );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: const Text('Profile Flow'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    final profile = await Navigator.of(context).push(
                      ProfileFlow.route(),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text('Profile Flow Complete!\n$profile'),
                        ),
                      );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.location_city),
                  title: const Text('Location Flow'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    final location = await Navigator.of(context).push(
                      LocationFlow.route(),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text('Location Flow Complete!\n$location'),
                        ),
                      );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.security_rounded),
                  title: const Text('Authentication Flow'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    await Navigator.of(context).push<AuthenticationState>(
                      AuthenticationFlow.route(),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Authentication Flow Complete!'),
                        ),
                      );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}