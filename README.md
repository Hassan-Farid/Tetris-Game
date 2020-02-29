An absolute bare-bones web app.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

# Dart
A client-optimized language for fast apps on any platform
Dart is:

Optimized for UI: Develop with a programming language specialized around the needs of user interface creation

Productive: Make changes iteratively: use hot reload to see the result instantly in your running app

Fast on all platforms: Compile to ARM & x64 machine code for mobile, desktop, and backend. Or compile to JavaScript for the web

Dart's flexible compiler technology lets you run Dart code in different ways, depending on your target platform and goals:

Dart Native: For programs targeting devices (mobile, desktop, server, and more), Dart Native includes both a Dart VM with JIT (just-in-time) compilation and an AOT (ahead-of-time) compiler for producing machine code.

Dart Web: For programs targeting the web, Dart Web includes both a development time compiler (dartdevc) and a production time compiler (dart2js).

Dart platforms illustration

License & patents
Dart is free and open source.

See LICENSE and PATENT_GRANT.

Using Dart
Visit the dart.dev to learn more about the language, tools, getting started, and more.

Browse pub.dev for more packages and libraries contributed by the community and the Dart team.

Building Dart
If you want to build Dart yourself, here is a guide to getting the source, preparing your machine to build the SDK, and building.

There are more documents on our wiki.

Contributing to Dart
The easiest way to contribute to Dart is to file issues.

You can also contribute patches, as described in Contributing.

# Dart WebDev

A command-line tool for developing and deploying web applications with Dart.

Requirements
The latest release of webdev requires Dart SDK 2.3 or later. This corresponds to Flutter SDK 1.5 or later.

To use webdev with a package, make sure you have entries in pubspec.yaml similar to:

...
dev_dependencies:
  build_runner: ^1.6.2
  build_web_compilers: ^2.0.0
...
build_web_compilers ^1.2.0 is supported, but with some limited functionality.

Installation
webdev is not meant to be used as a dependency. Instead, it should be "activated".

$ pub global activate webdev
# or
$ flutter pub global activate webdev
Learn more about activating and using packages here.

Usage
webdev provides two commands: serve and build.

webdev serve
Run a local web development server and a file system watcher that rebuilds on
changes.

Usage: webdev serve [arguments] [<directory>[:<port>]]...
    --auto                        Automatically performs an action after each
                                  build:

                                  restart: Reload modules and re-invoke main
                                  (loses current state)
                                  refresh: Performs a full page refresh.
                                  [restart, refresh]

    --[no-]debug                  Enable the launching of DevTools (Alt + D /
                                  Option + D). This also enables
                                  --launch-in-chrome.

    --[no-]debug-extension        Enable the backend for the Dart Debug
                                  Extension.

    --[no-]injected-client        Whether or not to inject the client.js script
                                  in web apps. This is required for all
                                  debugging related features, but may interact
                                  poorly with proxy servers or other
                                  environments.
                                  (defaults to on)

Advanced:
    --chrome-debug-port           Specify which port the Chrome debugger is
                                  listening on. If used with launch-in-chrome
                                  Chrome will be started with the debugger
                                  listening on this port.

    --hostname                    Specify the hostname to serve on.
                                  (defaults to "localhost")

    --[no-]launch-in-chrome       Automatically launches your application in
                                  Chrome with the debug port open. Use
                                  chrome-debug-port to specify a specific port
                                  to attach to an already running chrome
                                  instance instead.

    --log-requests                Enables logging for each request to the
                                  server.

    --tls-cert-chain              The file location to a TLS Certificate to
                                  create an HTTPs server.
                                  Must be used with tls-cert-key.

    --tls-cert-key                The file location to a TLS Key to create an
                                  HTTPs server.
                                  Must be used with tls-cert-chain.

Common:
-h, --help                        Print this usage information.
-o, --output                      A directory to write the result of a build to.
                                  Or a mapping from a top-level directory in the
                                  package to the directory to write a filtered
                                  build output to. For example "web:deploy".
                                  A value of "NONE" indicates that no "--output"
                                  value should be passed to `build_runner`.
                                  (defaults to "NONE")

-r, --[no-]release                Build with release mode defaults for builders.
    --[no-]build-web-compilers    If a dependency on `build_web_compilers` is
                                  required to run.
                                  (defaults to on)

-v, --verbose                     Enables verbose logging.

Run "webdev help" to see global options.
webdev build
Run builders to build a package.

Usage: webdev build [arguments]
-h, --help                        Print this usage information.
-o, --output                      A directory to write the result of a build to.
                                  Or a mapping from a top-level directory in the
                                  package to the directory to write a filtered
                                  build output to. For example "web:deploy".
                                  A value of "NONE" indicates that no "--output"
                                  value should be passed to `build_runner`.
                                  (defaults to "web:build")

-r, --[no-]release                Build with release mode defaults for builders.
                                  (defaults to on)

    --[no-]build-web-compilers    If a dependency on `build_web_compilers` is
                                  required to run.
                                  (defaults to on)

-v, --verbose                     Enables verbose logging.

Run "webdev help" to see global options.

# Dart StageHand Project Generator

Helps you get set up!
Stagehand helps you get your Dart projects set up and ready for the big show. It's a Dart project scaffolding generator, inspired by tools like Web Starter Kit and Yeoman.

Dart-savvy IDEs and editors use Stagehand behind the scenes to get project templates, but you can also use Stagehand on the command line (stagehand).

Stagehand templates
console-simple - A simple command-line application.
console-full - A command-line application sample.
package-simple - A starting point for Dart libraries or applications.
server-shelf - A web server built using the shelf package.
web-angular - A web app with material design components.
web-simple - A web app that uses only core Dart libraries.
web-stagexl - A starting point for 2D animation and games.
Installation
If you want to use Stagehand on the command line, install it using pub global activate:

> pub global activate stagehand
To update Stagehand, use the same pub global activate command.

Usage
Stagehand generates a project skeleton into the current directory. For example, here's how you create a package with Stagehand:

> mkdir fancy_project
> cd fancy_project
> stagehand package-simple
Here's how you list all of the project templates:

> stagehand
Goals
Opinionated and prescriptive; minimal to no options
Support for server and client apps
The best way to create a new Dart project
Used by IntelliJ, WebStorm, Visual Studio Code, Atom, Sublime, and more
Distributed as a pub package
Issues and bugs
Please file reports on the GitHub issue tracker.

Contributing
Contributions welcome! Please read this short guide first.




