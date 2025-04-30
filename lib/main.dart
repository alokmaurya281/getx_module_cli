import 'dart:io';

/// Entry point for the GetX Module CLI tool.
///
/// This script generates a GetX module folder structure with:
/// - Bindings
/// - Controllers
/// - Views
/// - Providers
///
/// Usage:
/// ```bash
/// getx_module_cli <module_name>
/// ```
///
/// Example:
/// ```bash
/// getx_module_cli home
/// ```
///
/// This will create:
/// ```
/// lib/modules/home/
/// ├── bindings/home_binding.dart
/// ├── controllers/home_controller.dart
/// ├── views/home_view.dart
/// └── providers/home_provider.dart
/// ```
void main(List<String> args) {
  if (args.isEmpty) {
    print('❌ Please provide a module name.');
    print('Usage: getx_module_cli <module_name>');
    exit(1);
  }

  final moduleName = args[0].toLowerCase();
  final capModuleName = moduleName[0].toUpperCase() + moduleName.substring(1);

  final basePath = 'lib/modules/$moduleName';
  final paths = [
    '$basePath/controllers',
    '$basePath/views',
    '$basePath/bindings',
    '$basePath/providers',
  ];

  // Create the directory structure
  for (var path in paths) {
    Directory(path).createSync(recursive: true);
  }

  // Generate binding file
  File('$basePath/bindings/${moduleName}_binding.dart').writeAsStringSync('''
import 'package:get/get.dart';
import '../controllers/${moduleName}_controller.dart';

class ${capModuleName}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${capModuleName}Controller>(() => ${capModuleName}Controller());
  }
}
''');

  // Generate controller file
  File('$basePath/controllers/${moduleName}_controller.dart').writeAsStringSync('''
import 'package:get/get.dart';

class ${capModuleName}Controller extends GetxController {
  // TODO: Add controller logic
}
''');

  // Generate view file
  File('$basePath/views/${moduleName}_view.dart').writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/${moduleName}_controller.dart';

class ${capModuleName}View extends GetView<${capModuleName}Controller> {
  const ${capModuleName}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('${capModuleName} View')),
      body: Center(child: Text('Welcome to ${capModuleName} Module')),
    );
  }
}
''');

  // Generate provider file
  File('$basePath/providers/${moduleName}_provider.dart').writeAsStringSync('''
// This is your API service layer for $moduleName module
class ${capModuleName}Provider {
  // TODO: Implement API methods
}
''');

  print('✅ Module "$moduleName" created at lib/modules/$moduleName');
}
