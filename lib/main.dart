import 'package:flutter/material.dart';

// Routes
import 'package:flutter_components/src/routes/routes.dart';

// Pages
import 'package:flutter_components/src/pages/alert_page.dart';

// internationalization
import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(MyApp());

 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // Configuración para la localización
        // https://flutter.dev/docs/development/accessibility-and-localization/internationalization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es', ''), // Español, no código del país
      ],
      //home: HomePage(),
      initialRoute: '/',
      routes: getAplicationRoute(),
      onGenerateRoute: ( RouteSettings settings){
        print('ruta llamada $settings.name');

        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );
      },
    );
  }
}