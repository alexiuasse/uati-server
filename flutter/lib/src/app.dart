import 'package:flutter/material.dart';
import 'package:whatilleat/src/components/shapes.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    ThemeData lightThemeData = ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(
        ThemeData(brightness: Brightness.light).textTheme,
      ),
      bottomSheetTheme: BottomSheetThemeData(shape: roundedShape),
      dialogTheme: DialogTheme(shape: fullRoundedShape),
      cardTheme: CardTheme(shape: fullRoundedShape, elevation: 4.0),
      primarySwatch: const MaterialColor(0xFFFF1919, {
        50: Color.fromRGBO(255, 25, 25, .1),
        100: Color.fromRGBO(255, 25, 25, .2),
        200: Color.fromRGBO(255, 25, 25, .3),
        300: Color.fromRGBO(255, 25, 25, .4),
        400: Color.fromRGBO(255, 25, 25, .5),
        500: Color.fromRGBO(255, 25, 25, .6),
        600: Color.fromRGBO(255, 25, 25, .7),
        700: Color.fromRGBO(255, 25, 25, .8),
        800: Color.fromRGBO(255, 25, 25, .9),
        900: Color.fromRGBO(255, 25, 25, 1),
      }),
    );
    ThemeData darkThemeData = ThemeData.dark().copyWith(
      textTheme: GoogleFonts.montserratTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ),
      bottomSheetTheme: BottomSheetThemeData(shape: roundedShape),
      dialogTheme: DialogTheme(shape: fullRoundedShape),
      cardTheme: CardTheme(shape: fullRoundedShape, elevation: 4.0),
    );
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',
          theme: lightThemeData,
          darkTheme: darkThemeData,
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SampleItemListView.routeName:
                  default:
                    return const SampleItemListView();
                }
              },
            );
          },
        );
      },
    );
  }
}
