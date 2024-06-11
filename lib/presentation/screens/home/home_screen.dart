import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:welcome_sprint/logic/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../widgets/common/custom_message.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const GetHomeInfo(text: 'Welcome Sprint'));
    super.initState();
  }

  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildHome(),
    );
  }

  Widget _buildHome() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: MultiBlocListener(
        listeners: [
          BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state.status == HomeStateStatus.error) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentMaterialBanner()
                  ..showMaterialBanner(
                      CustomMessage(message: state.errorMessage!, title: "TITRE", contentType: ContentType.failure).build(context));
              }
            },
          ),
        ],

        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStateStatus.initial || state.status == HomeStateStatus.loading) {
              return const SpinKitCircle(color: Colors.blue);

            } else if (state.status == HomeStateStatus.loaded) {
              _text = state.text;
              return _buildContent(context, _text);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

