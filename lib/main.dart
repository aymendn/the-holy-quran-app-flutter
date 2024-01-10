import 'package:flutter/material.dart';
import 'package:my_quran_app/providers/bookmark.dart';
import 'package:my_quran_app/providers/theme_provider.dart';
import 'package:my_quran_app/providers/toast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/index.dart';
import 'providers/quran.dart';
import 'providers/show_overlay_provider.dart';
import 'screens/douaa_screen.dart';
import 'screens/home_screen.dart';
import 'screens/index_screen.dart';
import 'screens/juz_index_screen.dart';
import 'screens/search_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<ShowOverlayProvider>(
          create: (context) => ShowOverlayProvider(),
        ),
        ChangeNotifierProvider<Quran>(
          create: (context) => Quran(prefs),
        ),
        ChangeNotifierProxyProvider<Quran, BookMarkProvider>(
          create: (context) => BookMarkProvider(prefs),
          update: (context, value, previous) =>
              previous!..update(value.currentPage),
        ),
        ChangeNotifierProxyProvider<Quran, ToastProvider>(
          create: (context) => ToastProvider(),
          update: (context, value, previous) =>
              previous!..update(value.hizbQuarter),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quran App',
          theme: AppTheme.lightThemeData,
          darkTheme: AppTheme.darkThemeData,
          themeMode: theme.themeMode,
          home: const HomeScreen(),
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [Locale("ar", "AE")],
          locale: const Locale("ar", "AE"),
          routes: {
            '/index': (context) => const IndexScreen(),
            '/juz-index': (context) => const JuzIndexScreen(),
            '/douaa': (context) => const DouaaScreen(),
            '/search': (context) => const SearchScreen(),
          },
        );
      },
    );
  }
}
