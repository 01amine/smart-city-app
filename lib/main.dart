import 'package:bsc/core/theme/theme.dart';
import 'package:bsc/features/auth/presentation/cubit/auth/auth_state.dart';
import 'package:bsc/features/auth/presentation/cubit/auth/auth_state_cubit.dart';
import 'package:bsc/features/home/presentation/home.dart';
import 'package:bsc/features/onboarding/presentation/onboarding_screen.dart';
import 'package:bsc/shared/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black))
      
      ;
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return BlocProvider(
      create: (context) => AuthStateCubit()..appStarted(),
      child: MaterialApp(
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthStateCubit, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return Home();
              }
              if (state is UnAuthenticated) {
                return OnboardingScreen();
              }
              return Container();
            },
          )),
    );
  }
}
