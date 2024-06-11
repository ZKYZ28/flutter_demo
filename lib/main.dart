import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:welcome_sprint/data/repositories/home_repository.dart';
import 'package:welcome_sprint/data/repositories/team_repository.dart';
import 'package:welcome_sprint/logic/blocs/home_bloc/home_bloc.dart';
import 'package:welcome_sprint/logic/blocs/notification_bloc/notification_bloc.dart';
import 'package:welcome_sprint/presentation/screens/auth/register_page.dart';
import 'package:welcome_sprint/presentation/widgets/common/bottom_navbar.dart';
import 'package:welcome_sprint/presentation/widgets/common/custom_message.dart';
import 'package:welcome_sprint/routes/app_router.dart';
import 'package:welcome_sprint/utils/message_manager.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'data/repositories/auth_repository.dart';
import 'logic/blocs/auth_bloc/auth_bloc.dart';
import 'logic/blocs/team_bloc/team_bloc.dart';

void main() async {
  //Init Firebase connection
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyAAETeJ1MIkCyn-AyJVIpj5f3AZqiq2bTc",
      appId: "1:928708831342:android:b58cc5bb448c1be8435e7f",
      messagingSenderId: "928708831342",
      projectId: "welcome-sprint-965f4"
  ));
  //Init Firebase for messages

  await MessageManager().initNotifications();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  runApp(MyApp(firestore: firestore));
}

class MyApp extends StatelessWidget {
  final FirebaseFirestore firestore;
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key, required this.firestore});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(homeRepository: HomeRepository())
        ),
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(authRepository: AuthRepository())
        ),
        BlocProvider<NotificationBloc>(
            create: (context) => MessageManager.notificationBloc
        ),
        BlocProvider<TeamBloc>(
          create: (context) => TeamBloc(teamRepository: TeamRepository(firestore))
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(appRouter: _appRouter),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  final AppRouter appRouter;

  MainPage({required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          // User is authenticated
          return  MultiBlocListener(
            listeners: [
              BlocListener<NotificationBloc, NotificationState>(
                listener: (context, state) {
                  if (state.status == NotificationStateStatus.notified) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentMaterialBanner()
                      ..showMaterialBanner(
                          CustomMessage(message: state.message!, title: state.title!, contentType: ContentType.help).build(context));
                  }
                },
              ),
            ],
            child: Scaffold(
              body: MaterialApp.router(
                routerConfig: appRouter.config(),
              ),
              bottomNavigationBar: BottomNavBar(appRouter: appRouter),
            ),
          );
        } else {
          return const RegisterPage();
        }
      },
    );
  }
}
