import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

const _onboardingInfoHeroTag = '__onboarding_info_hero_tag__';

enum AboutState {
  initial,
  welcomeComplete,
  usageComplete,
  onboardingComplete,
}

List<Page> onGenerateAboutPages(AboutState state, List<Page> pages) {
  switch (state) {
    case AboutState.usageComplete:
      return [
        AboutWelcome.page(),
        AboutUsage.page(),
        AboutComplete.page(),
      ];
    case AboutState.welcomeComplete:
      return [
        AboutWelcome.page(),
        AboutUsage.page(),
      ];
    case AboutState.initial:
    default:
      return [AboutWelcome.page()];
  }
}

class AboutFlow extends StatelessWidget {
  static Route<AboutState> route() {
    return MaterialPageRoute(builder: (_) => AboutFlow());
  }

  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      state: AboutState.initial,
      observers: [HeroController()],
      onGeneratePages: onGenerateAboutPages,
    );
  }
}

class AboutWelcome extends StatelessWidget {
  static Page page() => MyPage<void>(child: AboutWelcome());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.flow<AboutState>().complete(),
        ),
        title: const Text('Welcome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome Text',
                    style: theme.textTheme.headline3,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: FloatingActionButton(
                heroTag: _onboardingInfoHeroTag,
                backgroundColor: Colors.orange,
                child: const Icon(Icons.info),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 0,
            onPressed: () => context.flow<AboutState>().complete(),
            child: const Icon(Icons.clear),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              context
                  .flow<AboutState>()
                  .update((_) => AboutState.welcomeComplete);
            },
            child: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}

class AboutUsage extends StatelessWidget {
  static Page page() => MyPage<void>(child: AboutUsage());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: const Text('Usage')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Usage Text',
                    style: theme.textTheme.headline3,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: FloatingActionButton(
                heroTag: _onboardingInfoHeroTag,
                backgroundColor: Colors.orange,
                child: const Icon(Icons.info),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 2,
            onPressed: () {
              context.flow<AboutState>().update((_) => AboutState.initial);
            },
            child: const Icon(Icons.arrow_back_ios_rounded),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            heroTag: 3,
            onPressed: () {
              context
                  .flow<AboutState>()
                  .update((_) => AboutState.usageComplete);
            },
            child: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}

class AboutComplete extends StatelessWidget {
  static Page page() => MyPage<void>(child: AboutComplete());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: const Text('Complete')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'All Done!',
                    style: theme.textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 10,
              child: FloatingActionButton(
                heroTag: _onboardingInfoHeroTag,
                backgroundColor: Colors.orange,
                child: const Icon(Icons.info),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 4,
            onPressed: () {
              context
                  .flow<AboutState>()
                  .update((_) => AboutState.welcomeComplete);
            },
            child: const Icon(Icons.arrow_back_ios_rounded),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            heroTag: 5,
            onPressed: () => context
                .flow<AboutState>()
                .complete((_) => AboutState.onboardingComplete),
            child: const Icon(Icons.check),
          ),
        ],
      ),
    );
  }
}

class MyPage<T> extends Page<T> {
  const MyPage({required this.child, LocalKey? key}) : super(key: key);

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
