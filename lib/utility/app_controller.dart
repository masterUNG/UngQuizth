import 'package:get/get.dart';
import 'package:ungquizth/models/user_model.dart';

class AppController extends GetxController {
  RxList<String?> typeUsers = <String?>[null].obs;

  RxList<UserModel> currentUserModels = <UserModel>[].obs;

  RxInt indexBody = 0.obs;
}
