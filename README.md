# GetX Module CLI

A Dart CLI tool to quickly scaffold GetX modules (bindings, views, controllers, providers) for Flutter apps.


This command will generate the module structure inside `lib/modules/<module_name>` in the current project directory.

The benefits of using this tool include:

*   Quickly scaffold a new GetX module
*   Consistent file structure for modules
*   Reduces boilerplate code
*   Saves time by automating the process


## Notes
Directory Creation: The tool will automatically create the required directories if they don’t exist.

Error Handling: If no module name is provided, the tool will show an error and provide usage instructions.




## Install

To install the `getx_module_cli` globally, run the following command:

```bash
dart pub global activate getx_module_cli

