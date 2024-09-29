// import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:trim_user/data/data_binding/data_binding.dart';
// import 'package:trim_user/utils/size-config/size_config.dart';
// import 'package:trim_user/utils/theme/app_theme.dart';
// import 'package:trim_user/utils/ui_sizedbox/web_custom_scroll.dart';
// import 'package:trim_user/views/auth_screens/splash_screen/splash_screen.dart';
// import 'package:trim_user/views/home_screens/review_and_confirm/review_and_confirm.dart';
// import 'package:trim_user/views/home_screens/review_and_confirm/success_booking_screen.dart';
// import 'package:trim_user/views/home_screens/salon_screen/latest_salon_screen.dart';
// import 'data/deep_linking/app_link.dart';
// import 'data/local_storage/get_storage.dart';

// Future<void> main() async {
//   ///for web
//   if (kIsWeb) {
//     try {
//       WidgetsFlutterBinding.ensureInitialized();
//       await Firebase.initializeApp(
//         options: const FirebaseOptions(
//           apiKey: "AIzaSyB6ajYc5DXThZ2XUDYEjQMwq23HSAAwCEU",
//           authDomain: "trimapp-407807.firebaseapp.com",
//           projectId: "trimapp-407807",
//           storageBucket: "trimapp-407807.appspot.com",
//           messagingSenderId: "148201515678",
//           appId: "1:148201515678:web:7f1d9014373028c02f698f",
//           measurementId: "G-95TFLKH2TR",
//         ),
//       );
//       await GetStorage.init();
//       print("access token ${GetLocalStorage().getAuthToken()}");
//       await dotenv.load(fileName: ".env");
//       Stripe.publishableKey = dotenv.get("STRIPE_PUBLIC_KEY_TEST");
//       Stripe.merchantIdentifier = "merchant.sigitechnologies.trimapplepay";
//       await Stripe.instance.applySettings();
//       AppLinkService appLinkService = AppLinkService();
//       appLinkService.initUniLinks();
//     } on FirebaseException catch (e) {
//       print("Firebase Exception ${e.toString()}");
//       if (e.code == 'duplicate-app') {
//         await Firebase.initializeApp();
//       }
//     } catch (e) {
//       print("Firebase Catch error  ${e.toString()}");
//     }
//     await SentryFlutter.init(
//           (options) {
//         options.dsn =
//         'https://a9b195e90f6634920de670abfd3d037b@o4505414587121664.ingest.us.sentry.io/4507168552452096';
//         options.tracesSampleRate = 1.0;
//         options.profilesSampleRate = 1.0;
//       },
//       appRunner: () => runApp(MyApp()),
//     );
//   }
//   else {
//     ///For mobile
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp();
//     SystemChrome.setPreferredOrientations(
//         [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//     await GetStorage.init();
//     print("access token ${GetLocalStorage().getAuthToken()}");
//     await dotenv.load(fileName: ".env");
//     Stripe.publishableKey = dotenv.get("STRIPE_PUBLIC_KEY_TEST");
//     Stripe.merchantIdentifier = "merchant.sigitechnologies.trimapplepay";
//     await Stripe.instance.applySettings();
//     AppLinkService appLinkService = AppLinkService();
//     appLinkService.initUniLinks();
//     await SentryFlutter.init(
//           (options) {
//         options.dsn =
//         'https://a9b195e90f6634920de670abfd3d037b@o4505414587121664.ingest.us.sentry.io/4507168552452096';
//         options.tracesSampleRate = 1.0;
//         options.profilesSampleRate = 1.0;
//       },
//       appRunner: () => runApp(MyApp()),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return GetMaterialApp(
//       defaultTransition: Transition.rightToLeft,
//       scrollBehavior: CustomScrollBehavior(),
//       //theme: lightTheme,
//       darkTheme: darkTheme,
//       themeMode: ThemeMode.dark,
//       debugShowCheckedModeBanner: false,
//       getPages: [
//         GetPage(
//           name: '/',
//           binding: DataBinding(),
//           page: () => SplashScreen(),
//         ),
//         GetPage(
//           name: '/salon-detail',
//           page: () => LatestSalonScreen(),
//         ),
//         if (kIsWeb) ...[
//           GetPage(
//             name: '/SuccessfulBookingScreen',
//             page: () => SuccessfulBookingScreen(),
//           ),
//           GetPage(
//             name: '/ReviewAndConfirm',
//             page: () => ReviewAndConfirm(),
//           ),
//         ]
//       ],
//     );
//   }
// }

// // import 'package:firebase_core/firebase_core.dart';

// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter_dotenv/flutter_dotenv.dart';
// // import 'package:flutter_stripe/flutter_stripe.dart';
// // import 'package:get/get.dart';
// // import 'package:get_storage/get_storage.dart';
// // import 'package:sentry_flutter/sentry_flutter.dart';
// // import 'package:trim_user/data/data_binding/data_binding.dart';
// // import 'package:trim_user/utils/size-config/size_config.dart';
// // import 'package:trim_user/utils/theme/app_theme.dart';
// // import 'package:trim_user/utils/ui_sizedbox/web_custom_scroll.dart';
// // import 'package:trim_user/views/auth_screens/splash_screen/splash_screen.dart';
// // import 'package:trim_user/views/auth_screens/verify_otp/verify_otp.dart';
// // import 'package:trim_user/views/home_screens/review_and_confirm/review_and_confirm.dart';
// // import 'package:trim_user/views/home_screens/review_and_confirm/success_booking_screen.dart';
// // import 'package:trim_user/views/home_screens/salon_screen/latest_salon_screen.dart';
// // import 'data/deep_linking/app_link.dart';
// // import 'data/local_storage/get_storage.dart';
// //
// //  Future<void> main() async
// //  {
// //    ///for web
// //    if(kIsWeb)
// //      {
// //        try{
// //          WidgetsFlutterBinding.ensureInitialized();
// //          await Firebase.initializeApp(
// //            options: const FirebaseOptions(
// //              apiKey: "AIzaSyB6ajYc5DXThZ2XUDYEjQMwq23HSAAwCEU",
// //              authDomain: "trimapp-407807.firebaseapp.com",
// //              projectId: "trimapp-407807",
// //              storageBucket: "trimapp-407807.appspot.com",
// //              messagingSenderId: "148201515678",
// //              appId: "1:148201515678:web:7f1d9014373028c02f698f",
// //              measurementId: "G-95TFLKH2TR",
// //              // apiKey: "AIzaSyB6ajYc5DXThZ2XUDYEjQMwq23HSAAwCEU",
// //              // projectId: "trimapp-407807",
// //              // messagingSenderId: "148201515678",
// //              // appId: "1:148201515678:web:7f1d9014373028c02f698f",
// //            ),
// //          );
// //          await GetStorage.init();
// //          print("access token ${GetLocalStorage().getAuthToken()}");
// //          await dotenv.load(fileName: ".env");
// //          Stripe.publishableKey = dotenv.get("STRIPE_PUBLIC_KEY_TEST");
// //          Stripe.merchantIdentifier = "merchant.sigitechnologies.trimapplepay";
// //          await Stripe.instance.applySettings();
// //          // DeepLinkService deepLinkService = DeepLinkService();
// //          // deepLinkService.initUniLinks();
// //
// //
// //          AppLinkService appLinkService = AppLinkService();
// //          appLinkService.initUniLinks();
// //
// //        } on FirebaseException catch (e) {
// //          print("Firebase Exception ${e.toString()}");
// //          if (e.code == 'duplicate-app') {
// //            await Firebase.initializeApp();
// //          }
// //
// //        }
// //      catch (e){
// //          print("Firebase Catch error  ${e.toString()}");
// //
// //        }
// //        await SentryFlutter.init(
// //              (options) {
// //            options.dsn = 'https://a9b195e90f6634920de670abfd3d037b@o4505414587121664.ingest.us.sentry.io/4507168552452096';
// //            options.tracesSampleRate = 1.0;
// //            options.profilesSampleRate = 1.0;
// //          },
// //          appRunner: () => runApp(MyApp()),
// //        );
// //      }
// //    else
// //      {
// //        ///For mobile
// //        WidgetsFlutterBinding.ensureInitialized();
// //        await Firebase.initializeApp();
// //        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
// //        await GetStorage.init();
// //        print("access token ${GetLocalStorage().getAuthToken()}");
// //        await dotenv.load(fileName: ".env");
// //        Stripe.publishableKey = dotenv.get("STRIPE_PUBLIC_KEY_TEST");
// //        Stripe.merchantIdentifier = "merchant.sigitechnologies.trimapplepay";
// //        await Stripe.instance.applySettings();
// //        AppLinkService appLinkService = AppLinkService();
// //        appLinkService.initUniLinks();
// //        await SentryFlutter.init(
// //              (options) {
// //            options.dsn = 'https://a9b195e90f6634920de670abfd3d037b@o4505414587121664.ingest.us.sentry.io/4507168552452096';
// //            options.tracesSampleRate = 1.0;
// //            options.profilesSampleRate = 1.0;
// //          },
// //          appRunner: () => runApp(MyApp()),
// //        );
// //      }
// //   // runApp(const MyApp());
// //   ///Sentry
// //  }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     SizeConfig().init(context);
// //     return GetMaterialApp(
// //       defaultTransition: Transition.rightToLeft,
// //       scrollBehavior: CustomScrollBehavior(),
// //       //theme: lightTheme,
// //       darkTheme: darkTheme,
// //       themeMode: ThemeMode.dark,
// //       debugShowCheckedModeBanner: false,
// //       getPages: [
// //             GetPage(
// //           name: '/',
// //           binding: DataBinding(),
// //            page: ()=> SplashScreen(),
// //         ),
// //         GetPage(
// //           name: '/salon-detail',
// //           page: () => LatestSalonScreen(),
// //         ),
// //         if(kIsWeb)...
// //         [
// //           GetPage(
// //             name: '/SuccessfulBookingScreen',
// //             page: () => SuccessfulBookingScreen(),
// //           ),
// //           GetPage(
// //             name: '/ReviewAndConfirm',
// //             page: () => ReviewAndConfirm(),
// //           ),
// //         ]
// //       ],
// //     );
// //   }
// // }