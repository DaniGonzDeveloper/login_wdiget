import 'package:flutter/material.dart';

const Color defaultAppColor = Color.fromARGB(249, 150, 18, 211);
const Color defaultAppColor2 = Color(0xFFeab57c);
const Color defaultAppWhiteColor = Color(0xffffffff);
const Color defaultBlack = Color(0xFF000000);
const Color defaultLightBlack = Color(0xFF181818);
const Color defaultGray = Color(0xFF807F7F);
const Color defaultAppColor3 = Color(0xFF313943);
Color defaultAppColor4 = const Color(0xFF4a707a);
const Color defaultLightYellowColor = Color(0xFFD3BF5F);
const Color defaultLightTealColor = Color(0xff4fbe9e);
const Color defaultFacebookColor = Color(0xff4267B2);

const Color defaultTwitterColor = Color(0xff00acee);
Color defaultLightWhite = defaultAppWhiteColor.withOpacity(0.1);

class Palette { 
  static const MaterialColor primaryColor = MaterialColor( 
    0xff402674, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch. 
     <int, Color>{ 
      50:  Color(0xff402674),//10% 
      100:  Color(0xff402674),//20% 
      200:  Color(0xff402674),//30% 
      300:  Color(0xff402674),//40% 
      400:  Color(0xff402674),//50% 
      500:  Color(0xff402674),//60% 
      600:  Color(0xff402674),//70% 
      700:  Color(0xff402674),//80% 
      800:  Color(0xff402674),//90% 
      900:  Color(0xff402674),//100% 
    }, 
  ); 
}