# antinna

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
```bash
[antinna] flutter pub get --no-example
Resolving dependencies...
Downloading packages...
Null check operator used on a null value
package:pub/src/source/hosted.dart 773:33              HostedSource._getAdvisories.readAdvisoriesFromCache
===== asynchronous gap ===========================
package:pub/src/source/hosted.dart 791:12              HostedSource._getAdvisories
===== asynchronous gap ===========================
package:pub/src/source/hosted.dart 1079:24             HostedSource.getAdvisoriesForPackageVersion
===== asynchronous gap ===========================
package:pub/src/solver/report.dart 414:26              SolveReport._reportPackage
===== asynchronous gap ===========================
package:pub/src/solver/report.dart 218:18              SolveReport._reportChanges
===== asynchronous gap ===========================
package:pub/src/solver/report.dart 73:21               SolveReport.show
===== asynchronous gap ===========================
package:pub/src/entrypoint.dart 568:5                  Entrypoint.acquireDependencies
===== asynchronous gap ===========================
package:pub/src/command/get.dart 77:5                  GetCommand.runProtected
===== asynchronous gap ===========================
package:pub/src/command.dart 196:7                     PubCommand.run
===== asynchronous gap ===========================
package:args/command_runner.dart 212:13                CommandRunner.runCommand
===== asynchronous gap ===========================
package:dartdev/dartdev.dart 232:18                    DartdevRunner.runCommand
===== asynchronous gap ===========================
package:dartdev/dartdev.dart 46:16                     runDartdev
===== asynchronous gap ===========================
C:\b\s\w\ir\x\w\sdk\pkg\dartdev\bin\dartdev.dart 13:5  main
This is an unexpected error. The full log and other details are collected in:

    C:\Users\DEEPAK SHARMA\AppData\Local\Pub\Cache\log\pub_log.txt

Consider creating an issue on https://github.com/dart-lang/pub/issues/new
and attaching the relevant parts of that log file.
exit code 1
```