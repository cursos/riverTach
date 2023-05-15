import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_app/models/user_model.dart';
import 'package:riverpod_app/pages/counter_page.dart';
import 'package:riverpod_app/pages/home_page.dart';
import 'package:riverpod_app/providers/counter_provider.dart';

import 'package:flutter/material.dart';
import 'package:riverpod_app/services/api_service.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const HomePage()),
  GoRoute(path: "/counter", builder: (context, state) => const CounterPage()),
]);


///StreamPod
/* final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
      const Duration(seconds: 2), (((computationCount) => computationCount)));
});
void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stream Provider'),
        ),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);
    return Center(
      child: streamData.when(
        data: (value) {
          return Text("Value is: $value");
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
 */

//futurePod
/* 
final apiProvider = Provider<ApiService>(
  (ref) {
    return ApiService();
  },
);

final userDataProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.read(apiProvider).getUser();
});
void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Center(
      child: userData.when(
          data: (data) {
            return ListView.builder(
              itemBuilder: ((context, index) {
                return ListTile(
                  title:
                      Text("${data[index].firstname} ${data[index].lastname}"),
                  subtitle: Text("${data[index].email}"),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CircleAvatar(
                      child: Image.network(
                        data[index].avatar,
                      ),
                    ),
                  ),
                );
              }),
              itemCount: data.length,
            );
          },
          error: ((error, stackTrace) => Text(error.toString())),
          loading: () => const CircularProgressIndicator()),
    );
  }
} */

/// riverpod using stateNotifier
/* 
final counterProvider =
    StateNotifierProvider<CounterProvider, int>((ref) => CounterProvider());
void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(counterProvider);

    ref.listen(counterProvider, (((previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("The value is $next")));
      }
      if (previous == 5) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("The value was $previous")));
      }
    })));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(counterProvider);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(value.toString()),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).decrement();
          },
          child: const Icon(Icons.arrow_downward_rounded),
        ),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).increment();
          },
          child: const Icon(Icons.arrow_upward_outlined),
        ),
      ]),
    );
  }
}
 */







///Cnosumer with statefullWidget

/* void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: HomePage());
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    final String value = ref.watch(helloWorldProvider);
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    final String value = ref.watch(helloWorldProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Statefull widget"),
      ),
      body: Center(child: Text(value)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

 */


///consumer with statelessWidget
///import 'package:flutter/material.dart';
/* import 'package:flutter_riverpod/flutter_riverpod.dart';

final myProvider = Provider<String>(
  (ref) => "String provider",
);

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final name = ref.watch(myProvider);
          print("hello");
          return Text(name);
        }),
      ),
    );
  }
}
 */