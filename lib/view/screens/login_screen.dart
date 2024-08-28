import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  static const id = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      body: GetBuilder<LoginControllerImp>(builder: (controller) {
        return SafeArea(
            minimum: const EdgeInsets.all(15),
            child: Center(
              child: SizedBox(
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: controller.username,
                      decoration:
                          const InputDecoration(label: Text('username')),
                    ),
                    const Gap(10),
                    TextField(
                      controller: controller.password,
                      obscureText: true,
                      decoration:
                          const InputDecoration(label: Text('password')),
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                              onPressed: controller.login,
                              icon: const Icon(Icons.login),
                              label: const Text('login')),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
      }),
    );
  }
}
