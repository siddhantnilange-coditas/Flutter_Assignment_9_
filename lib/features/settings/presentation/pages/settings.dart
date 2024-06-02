import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/features/on_boarding/presentation/pages/splash_screen.dart';
import 'package:navigation_assignment/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:navigation_assignment/features/settings/presentation/bloc/settings_events.dart';
import 'package:navigation_assignment/features/settings/presentation/bloc/settings_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    List<String> languages = ['English', 'Hindi', 'Marathi', 'Arabic'];

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: whitethemeColor,
        backgroundColor: whitethemeColor,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Settings',
            style: TextStyle(
              fontSize: 20,
              color: blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      backgroundColor: whitethemeColor,
      body: BlocProvider(
        create: (context) => LanguageBloc(),
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Sidd',
                  style: TextStyle(
                    fontSize: 16,
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: blackColor,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 16,
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 230,
                child: BlocBuilder<LanguageBloc, LaguageInitialState>(
                  builder: (context, state) {
                    return state is LanguageState
                        ? ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: languages.length,
                            itemBuilder: (context, index) {
                              return RadioListTile<int>(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text('${languages[index]}'),
                                  value: index,
                                  groupValue: state.selectedIndex,
                                  onChanged: (int? value) {
                                    if (value != null) {
                                      context
                                          .read<LanguageBloc>()
                                          .add(SelectedLanguageEvent(value));
                                    }
                                  });
                            })
                        : Text('No Settings');
                  },
                ),
              ),
              Divider(
                thickness: 1,
                color: blackColor,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () async {
                    final sharedPref = await SharedPreferences.getInstance();

                    sharedPref.setBool(SplashScreenState.loginStatus, false);
                    context.go('/login');
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 16,
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
