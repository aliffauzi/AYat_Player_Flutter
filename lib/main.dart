import 'provider/audio_player.dart';
import 'util/constants.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'data/sharedpref.dart';
import 'provider/audio_query.dart';
import 'routes/routes.dart';
import 'util/theme_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(AyatPlayer());
}

class AyatPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SharedPersistantSettings()),
        ChangeNotifierProvider.value(value: AudioQuery()),
        ChangeNotifierProvider.value(value: AudioPlayer()),
      ],
      child: Consumer<SharedPersistantSettings>(
        builder: (context, SharedPersistantSettings _pref, _) => MaterialApp(
          title: Constants.appName,
          debugShowCheckedModeBanner: false,
          theme: _pref.isDarkMode
              ? ThemeConstants.darkTheme
              : ThemeConstants.lightTheme,
          routes: routes,
        ),
      ),
    );
  }
}
