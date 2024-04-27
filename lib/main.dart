import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trikeright/core/boxes/hive_boxes.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';
import 'package:trikeright/features/history/data/history_item.dart';
import 'package:trikeright/features/history/data/history_list_provider.dart';
import 'package:trikeright/features/splashscreen/presentation/pages/splash_screen.dart';
import 'package:trikeright/features/trikeright_map/data/drag_handle_provider.dart';
import 'package:trikeright/features/trikeright_map/data/feature_provider.dart';
import 'package:trikeright/features/trikeright_map/data/routeresponse_provider.dart';
import 'package:trikeright/features/trikeright_map/data/services/openstreetmap_api.dart';
import 'package:trikeright/features/trikeright_map/data/textediting_controller_provider.dart';
import 'package:trikeright/features/user_setup/data/passenger_type_provider.dart';
import 'package:trikeright/features/user_setup/data/passenger_types.dart';
import 'package:trikeright/routing/app_routing.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(PassengerTypeAdapter());
  Hive.registerAdapter(HistoryItemAdapter());
  hiveBox = await Hive.openBox<HistoryItem>('historyListBox');

  await dotenv.load(fileName: "assets/config/.env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PassengerTypeProvider()),
        ChangeNotifierProvider(create: (_) => TextEditingControllerProvider()),
        ChangeNotifierProvider(create: (_) => FeatureProvider()),
        ChangeNotifierProvider(create: (_) => RouteResponseProvider()),
        ChangeNotifierProvider(create: (_) => OpenStreetMapApi()),
        ChangeNotifierProvider(create: (_) => DragHandleProvider()),
        ChangeNotifierProvider(create: (_) => HistoryListProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

Future _initApp() async {
  await Future.delayed(const Duration(seconds: 3));
  return SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp(
        routes: AppRouting.routes,
        debugShowCheckedModeBanner: false,
        title: 'TrikeRight',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: FutureBuilder(
          future: _initApp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.getBool('isFirstTime') == null ||
                  snapshot.data.getBool('isFirstTime') == true) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pushReplacementNamed('/user_setup');
                });
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context)
                      .pushReplacementNamed('/persistent_nav_bar');
                });
              }
            }
            return Container(); // return an empty container if none of the conditions are met
          },
        ),
      ),
    );
  }
}
