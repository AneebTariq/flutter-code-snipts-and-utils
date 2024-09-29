// import 'package:get/get.dart';
// import 'package:trim_user/data/Repo/auth_repo/auth_repo.dart';
// import 'package:trim_user/data/Repo/salon_repo/salon_repo.dart';
// import 'package:trim_user/data/api/auth_provider/auth_provider.dart';
// import 'package:trim_user/data/api/salon_provider/salon_provider.dart';
// import 'package:trim_user/data/controllers/auth_controller/auth_controller.dart';
// import 'package:trim_user/data/local_storage/get_storage.dart';
// import 'package:trim_user/utils/toasts.dart';
// import 'package:uni_links/uni_links.dart';
// import '../controllers/salon_controller/salon_controller.dart';
// class DeepLinkService {
//
//   final SalonController salonController = Get.put(SalonController(
//       salonRepo: SalonRepo(salonProvider: SalonProvider())));
//   final AuthController authController = Get.put(AuthController(
//       authRepo: AuthRepo(auth: AuthProvider())));
//   Future<void> initUniLinks() async {
//     final initialLink = await getInitialLink();
//     _handleDeepLink(initialLink);
//     linkStream.listen((String? deepLink) {
//       _handleDeepLink(deepLink);
//     });
//   }
//
//   Future<void> _handleDeepLink(String? deepLink) async {
//     if (deepLink != null) {
//       Get.log("link  $deepLink");
//       if (deepLink.contains("/salon-detail")) {
//         var list = deepLink.split("/");
//         String id = list.last;
//         int salonId = int.tryParse(id) ?? -1;
//         print(' salon id link $salonId');
//
//         if (salonId != -1)
//         {
//           print('the token ${GetLocalStorage().getAuthToken()}');
//           if(GetLocalStorage().getAuthToken()!="" || GetLocalStorage().getAuthToken()!=null)
//           {
//             await salonController.getSalonData(salonId);
//             deepLink="";
//           }
//           else
//           {
//             CustomToast.successToast(msg: 'Please Sign up \nBefore entering');
//             authController.checkSession();
//           }
//
//         } else {
//           Get.log("Invalid salon ID: $id");
//         }
//       }
//     }
//   }
// }