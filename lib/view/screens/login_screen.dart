import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mvvm_with_riverpod_dio/core/providers/providers.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("Login");
    final controller = ref.read(loginControllerProvider.notifier);

    // TextEditingControllers using hooks
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, _) {
                final state = ref.watch(loginControllerProvider);
                return Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: state.rememberMe,
                          onChanged: (_) => controller.toggleRememberMe(),
                        ),
                        const Text("Remember Me"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.isLoading
                            ? null
                            : () {
                                controller.login(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              },
                        child: state.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text("Login"),
                      ),
                    ),
                    if (state.emailError != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        state.emailError!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                    if (state.passwordError != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        state.passwordError!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
