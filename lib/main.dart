import 'package:braga8_app_components/views/meter-input/view_meter_screen.dart';
import 'package:flutter/material.dart';
import 'views/dashboard/dashboard_screen.dart';

void main() {
  runApp(const Braga8App());
}

class Braga8App extends StatelessWidget {
  const Braga8App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Braga8 Utility',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF523631),
          brightness: Brightness.dark,
          primary: Color(0xFF523631),
        ),
        scaffoldBackgroundColor: Color(0xFF141315),
        splashColor: Color(0xFF786161).withValues(alpha: .1),
        highlightColor: Color(0xFF786161).withValues(alpha: .05),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Color(0xFF523631).withValues(alpha: .4),
          cursorColor: Color(0xFF523631),
          selectionHandleColor: Color(0xFF523631),
        ),

        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      debugShowCheckedModeBanner: false,
      home: ViewMeterScreen(tenantName: 'solaria', unitData: {},),
    );
  }
}
