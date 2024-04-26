import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';
import 'package:trikeright/features/history/data/history_item.dart';
import 'package:trikeright/features/history/data/history_item_provider.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PassengerTypeAdapter());
  Hive.registerAdapter(HistoryItemAdapter());

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

Future _initHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
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
        home: const SplashScreen(),
      ),
    );
  }
}
