// import 'dart:async';
// import 'package:app_links/app_links.dart';
// import 'package:get/get.dart';
// import 'package:trim_user/data/Repo/auth_repo/auth_repo.dart';
// import 'package:trim_user/data/Repo/salon_repo/salon_repo.dart';
// import 'package:trim_user/data/api/auth_provider/auth_provider.dart';
// import 'package:trim_user/data/api/salon_provider/salon_provider.dart';
// import 'package:trim_user/data/controllers/auth_controller/auth_controller.dart';
// import 'package:trim_user/data/local_storage/get_storage.dart';
// import 'package:trim_user/utils/toasts.dart';
// import '../controllers/salon_controller/salon_controller.dart';
// import 'package:flutter/foundation.dart';

// class AppLinkService {

//   final SalonController salonController = Get.put(SalonController(salonRepo: SalonRepo(salonProvider: SalonProvider())));
//   final AuthController authController = Get.put(AuthController(authRepo: AuthRepo(auth: AuthProvider())));

//   late AppLinks _appLinks;
//   StreamSubscription<Uri>? _linkSubscription;

//   Future<void> initUniLinks() async {
//     _appLinks = AppLinks();
//     _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
//       print('onAppLink: $uri');
//       openAppLink(uri);
//     });
//   }

//   Future<void> openAppLink(Uri? applink) async {
//     if (applink != null) {
//       Get.log("link  $applink");
//       if(kIsWeb)
//         {
//           if (applink.path.contains("/LatestSalonScreen")) {
//             var list = applink.path.split("/");
//             String id = list.last;
//             int salonId = int.tryParse(id) ?? -1;
//             print(' salon id link $salonId');

//             if (salonId != -1)
//             {
//               print('the token ${GetLocalStorage().getAuthToken()}');
//               if(GetLocalStorage().getAuthToken()!="" || GetLocalStorage().getAuthToken()!=null)
//               {
//                   await salonController.getSalonData(salonId);
//                   applink=null;
//               }
//               else
//               {
//                 CustomToast.successToast(msg: 'Please Sign up \nBefore entering');
//                 authController.checkSession();
//               }

//             }
//             else {
//               Get.log("Invalid salon ID: $id");
//             }
//           }
//         }
//       else
//         {
//           if (applink.path.contains("/salon-detail")) {
//             var list = applink.path.split("/");
//             String id = list.last;
//             int salonId = int.tryParse(id) ?? -1;
//             print(' salon id link $salonId');

//             if (salonId != -1)
//             {
//               print('the token ${GetLocalStorage().getAuthToken()}');
//               if(GetLocalStorage().getAuthToken()!="" || GetLocalStorage().getAuthToken()!=null)
//               {

//                   await salonController.getSalonData(salonId);
//                   applink=null;
//               }
//               else
//               {
//                 CustomToast.successToast(msg: 'Please Sign up \nBefore entering');
//                 authController.checkSession();
//               }

//             }
//             else {
//               Get.log("Invalid salon ID: $id");
//             }
//           }

//         }
//     }
//   }
// }
