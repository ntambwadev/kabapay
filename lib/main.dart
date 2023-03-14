import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kabapay/firestore/firestore_service.dart';
import 'package:kabapay/models/current_transaction_model.dart';
import 'package:kabapay/models/recipient_model.dart';
import 'package:kabapay/models/token_model.dart';
import 'package:kabapay/models/transaction_model.dart';
import 'package:kabapay/models/user_model.dart';
import 'package:kabapay/models/vault_data_model.dart';
import 'package:kabapay/utils/biometrics_utils.dart';
import 'package:provider/provider.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:google_fonts/google_fonts.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
import 'models/payment_instrument_model.dart';

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//
//   print("Handling a background message: ${message.messageId}");
// }
//
// onBackgroundMessage(SmsMessage message) {
//   debugPrint("main onBackgroundMessage called: ${message.body}");
// }
//
// initMessagingNotification() async {
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   final fcmToken = await FirebaseMessaging.instance.getToken();
//   debugPrint('fcmToken: ${fcmToken}');
//   FFAppState().fcmToken = fcmToken;
//
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );
//   print('User granted permission: ${settings.authorizationStatus}');
//
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Got a message whilst in the foreground!');
//     print('Message data: ${message.data}');
//
//     if (message.notification != null) {
//       print('Message also contained a notification: ${message.notification}');
//     }
//   });
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await FFLocalizations.initialize();

  if (!kIsWeb) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }
  // await initMessagingNotification();
  // await initializeFirebaseRemoteConfig();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = FFLocalizations.getStoredLocale();
  ThemeMode _themeMode = ThemeMode.system;

  late Stream<KabapayFirebaseUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
    userStream = kabapayFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 1),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
    FFLocalizations.storeLocale(language);
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<VaultDataModel?>(
          initialData: null,
          create: (context) =>
              FirestoreService().streamVaultData(),
          catchError:(context, err) {
            debugPrint('VAULT DATA MODEL PROVIDER ERROR: ${err.toString()}');
            return null;
          },
        ),
        StreamProvider<UserModel?>(
          initialData: null,
          create: (context) =>
              FirestoreService().streamCurrentUserData(currentUserUid),
          catchError:(context, err) {
            debugPrint('USER MODEL PROVIDER ERROR: ${err.toString()}');
            return null;
          },
        ),
        StreamProvider<double?>(
          initialData: null,
          create: (context) =>
              FirestoreService().streamCurrentUserTotal(currentUserUid),
          catchError:(context, err) {
            debugPrint('USER DATA TOTAL PROVIDER ERROR: ${err.toString()}');
            return null;
          },
        ),
        StreamProvider<List<TransactionModel>>(
          initialData: [],
          create: (context) =>
            FirestoreService().streamTransactions(currentUserUid),
          catchError: (context, err) {
            debugPrint('TRANSACTION MODEL PROVIDER ERROR: ${err.toString()}');
            return List.empty();
          },
        ),
        StreamProvider<List<TokenModel>>(
          initialData: [],
          create: (context) =>
              FirestoreService().streamTokens(currentUserUid),
          catchError: (context, err) {
            debugPrint('TOKENS MODEL PROVIDER ERROR: ${err.toString()}');
            return List.empty();
          },
        ),
        StreamProvider<List<RecipientModel>>(
          initialData: [],
          create: (context) =>
              FirestoreService().streamRecipients(currentUserUid),
          catchError: (context, err) {
            debugPrint('RECIPIENT MODEL PROVIDER ERROR: ${err.toString()}');
            return List.empty();
          },
        ),
        StreamProvider<List<PaymentInstrumentModel>>(
          initialData: [],
          create: (context) =>
              FirestoreService().streamUserPaymentInstruments(currentUserUid),
          catchError:(context, err) {
            debugPrint('PAYMENT INSTRUMENT PROVIDER ERROR: ${err.toString()}');
            return List.empty();
          },
        ),
        ChangeNotifierProvider(create: (context) => CurrentTransactionModel()),
      ],
      child: MaterialApp.router(
        title: 'kabapay',
        localizationsDelegates: [
          FFLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [
          Locale('en'),
          Locale('fr'),
          Locale('sw'),
        ],
        theme: ThemeData(brightness: Brightness.light),
        themeMode: _themeMode,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'home_page';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
    _checkAuthentification();
  }

  _checkAuthentification() async {
    if (BiometricsUtils.isFirstLaunchDone) {
      return;
    }
    BiometricsUtils.isFirstLaunchDone = true;
    if(!await BiometricsUtils.validateBiometric(context)) {
      await signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'home_page': HomePageWidget(),
      'settings_page': SettingsPageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    // preloads all items here
    Provider.of<VaultDataModel?>(context);
    Provider.of<UserModel?>(context);
    Provider.of<double?>(context);
    // Provider.of<bool>(context);
    Provider.of<List<TokenModel>>(context);
    Provider.of<List<RecipientModel>>(context);
    Provider.of<List<TransactionModel>>(context);
    Provider.of<List<PaymentInstrumentModel>>(context);
    Provider.of<CurrentTransactionModel>(context, listen: false)
        .addUserId(currentUserUid);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: Colors.white,
        selectedItemColor: FlutterFlowTheme.of(context).primaryColor,
        unselectedItemColor: Color(0x8A000000),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24.0,
            ),
            label: FFLocalizations.of(context).getText(
              '5f7w2rwu' /* Home */,
            ),
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 24.0,
            ),
            label: FFLocalizations.of(context).getText(
              'lgf10g04' /* Home */,
            ),
            tooltip: '',
          )
        ],
      ),
    );
  }
}
