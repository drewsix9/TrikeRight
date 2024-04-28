import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trikeright/core/boxes/hive_boxes.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';
import 'package:trikeright/features/history/data/history_item.dart';
import 'package:trikeright/features/history/data/history_list_provider.dart';
import 'package:trikeright/features/persistent_nav_bar/presentation/pages/persistent_nav_bar.dart';
import 'package:trikeright/features/trikeright_map/data/drag_handle_provider.dart';
import 'package:trikeright/features/trikeright_map/data/feature_provider.dart';
import 'package:trikeright/features/trikeright_map/data/routeresponse_provider.dart';
import 'package:trikeright/features/trikeright_map/data/services/openstreetmap_api.dart';
import 'package:trikeright/features/trikeright_map/data/textediting_controller_provider.dart';
import 'package:trikeright/features/user_setup/data/passenger_type_provider.dart';
import 'package:trikeright/features/user_setup/data/passenger_types.dart';
import 'package:trikeright/features/user_setup/presentation/pages/user_setup_page.dart';
import 'package:trikeright/routing/app_routing.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await Future.delayed(const Duration(seconds: 3));
  prefs = await SharedPreferences.getInstance();

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFirstTime = prefs?.getBool('isFirstTime') ?? true;
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp(
          routes: AppRouting.routes,
          debugShowCheckedModeBanner: false,
          title: 'TrikeRight',
          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: isFirstTime ? const UserSetupPage() : const PersistentNavBar()),
    );
  }
}
