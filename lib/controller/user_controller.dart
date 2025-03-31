import 'package:get/get.dart';
import 'package:exam_app/SQLite/database_helper.dart';

class UserController extends GetxController {
  var usersList = <Map<String, dynamic>>[].obs;
  DatabaseHelper db = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  Future<void> loadUsers() async {
    var users = await db.getAllUsers();
    usersList.assignAll(users);
  }

  Future<void> addUser(String name, String email, String password) async {
    int res = await db.insertUser(name, email, password);
    if (res > 0) {
      loadUsers();
      Get.snackbar("User add Successful",
          "$name is Add Successfully");
    }
  }

  Future<void> deleteUser(int userId) async {
    await db.deleteUser(userId);
    usersList.removeWhere((user) => user['usrId'] == userId);
    Get.snackbar("Success", "User Deleted Successfully!");
  }

  // update user
  Future<void> updateUser(int userId, String name, String email, String password) async {
    int res = await db.updateUser(userId, name, email, password);
    if (res > 0) {
      loadUsers();
      Get.snackbar("Success Updated", "User Updated Successfully");
    }
  }

}
