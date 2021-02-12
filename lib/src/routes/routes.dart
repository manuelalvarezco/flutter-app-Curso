import 'package:flutter/material.dart';

// Pages
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/animated_container.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/pages/card_page.dart';
import 'package:flutter_components/src/pages/home_page.dart';
import 'package:flutter_components/src/pages/input_page.dart';

Map<String, WidgetBuilder> getAplicationRoute(){
  return <String, WidgetBuilder>{
        '/' : (BuildContext context ) => HomePage(),
        'alert' : (BuildContext context ) => AlertPage(),
        'avatar' : (BuildContext context ) => AvatarPage(),
        'card' : (BuildContext context ) => CardPage(),
        'animatedContainer' : (BuildContext context ) => AnimatedContainerPage(),
        'inputs' : (BuildContext context ) => InputPage(),
      };
}