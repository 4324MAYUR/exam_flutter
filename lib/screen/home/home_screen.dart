import 'package:exam_app/SQLite/database_helper.dart';
import 'package:exam_app/controller/user_controller.dart';
import 'package:exam_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  DatabaseHelper db = DatabaseHelper();
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "HOME SCREEN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined, size: 28),
            onPressed: () {
              db.logout();
              Get.offAllNamed(GetRoutes.login);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(() {
            if (userController.usersList.isEmpty) {
              return const Text(
                "Your Contacts Is Empty",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
            return ListView.builder(
              itemCount: userController.usersList.length,
              itemBuilder: (context, index) {
                final user = userController.usersList[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.blue.shade100,
                      child: Text(
                        "${user['usrId']}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(
                      user['fullName'],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      user['email'],
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.mode_edit_outline_outlined,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Update User"),
                                content: SingleChildScrollView(
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 20),
                                        // Name TextFormField Edit
                                        TextFormField(
                                          controller: nameController,
                                          decoration: InputDecoration(
                                            labelText: "User Name",
                                           ),
                                          validator: (value) => value!.isEmpty
                                              ? "Enter User Name"
                                              : null,
                                        ),
                                        SizedBox(height: 20),
                                        // Email TextFormField
                                        TextFormField(
                                          controller: emailController,
                                          decoration: const InputDecoration(
                                              labelText: "E-mail"),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Enter Email";
                                            } else if (!RegExp(
                                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                                .hasMatch(value)) {
                                              return "Enter a valid email";
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: 20),
                                        // Password TextFormField
                                        TextFormField(
                                          controller: passwordController,
                                          obscureText: true,
                                          decoration: const InputDecoration(
                                              labelText: "Password"),
                                          validator: (value) => (value ==
                                                      null ||
                                                  value.length < 6)
                                              ? "Password must be at least 6 characters"
                                              : null,
                                        ),
                                        const SizedBox(height: 30),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              userController.updateUser(
                                                user['usrId'],
                                                nameController.text,
                                                emailController.text,
                                                passwordController.text,
                                              );
                                              nameController.clear();
                                              emailController.clear();
                                              passwordController.clear();
                                              Get.back();
                                            }
                                          },
                                          child: const Text("Update"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                          onPressed: () => userController.deleteUser(
                            user['usrId'],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Add User"),
              content: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20),
                      // Name TextFormField
                      TextFormField(
                        controller: nameController,
                        decoration:
                            const InputDecoration(labelText: "User Name"),
                        validator: (value) =>
                            value!.isEmpty ? "Enter User Name" : null,
                      ),
                      SizedBox(height: 20),
                      // Email TextFormField
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(labelText: "E-mail"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Email";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // Password TextFormField
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration:
                            const InputDecoration(labelText: "Password"),
                        validator: (value) =>
                            (value == null || value.length < 6)
                                ? "Password must be at least 6 characters"
                                : null,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          String name = nameController.text;
                          String email = emailController.text;
                          String pass = passwordController.text;
                          if (formKey.currentState!.validate()) {
                            userController.addUser(
                              name,
                              email,
                              pass,
                            );
                            nameController.clear();
                            emailController.clear();
                            passwordController.clear();
                            Get.back();
                          }
                        },
                        child: const Text("Done"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add_circle_rounded),
      ),
    );
  }
}
