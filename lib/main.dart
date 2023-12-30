import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smuctian/application/bustracker.p.dart';
import 'package:smuctian/application/cgcalc/cgcalc.provider.dart';
import 'package:smuctian/application/classroom.p.dart';
import 'package:smuctian/application/home.p.dart';
import 'package:smuctian/application/login_provider.dart';
import 'package:smuctian/application/profile.p.dart';
import 'package:smuctian/domain/global_singleton.dart';
import 'package:smuctian/presentation/Profile_Intake_view.dart';
import 'package:smuctian/presentation/bustraker.v.dart';
import 'package:smuctian/presentation/class_list.dart';
import 'package:smuctian/presentation/classroom_details.dart';
import 'package:smuctian/presentation/forms/emergency_contact_info_intake_form.dart';
import 'package:smuctian/presentation/forms/helping_hand_info_intake_form.dart';
import 'package:smuctian/presentation/forms/member_add_view.dart';
import 'package:smuctian/presentation/sublet_member_view.dart';
import 'package:smuctian/presentation/home_view.dart';
import 'package:smuctian/presentation/login.dart';
import 'package:smuctian/presentation/otp.dart';
import 'package:smuctian/routing/routings.dart';
import 'package:smuctian/theme_data.dart';
import 'package:provider/provider.dart';

import 'presentation/landing.dart';
import 'presentation/map_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalAppSingleton.instance.init();
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..indicatorColor = Colors.lightBlueAccent;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider<ClassroomProvider>(
          create: (_) => ClassroomProvider(),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (_) => ProfileProvider(),
        ),
        ChangeNotifierProvider<BusTrackerProvider>(
          create: (_) => BusTrackerProvider(),
        ),
        ChangeNotifierProvider(create: (_) => CGCalcProvider())
      ],
      child: MaterialApp(
        builder: EasyLoading.init(),
        routes: {
          Routes.instance.landing: (context) => const LandingView(),
          Routes.instance.login: (context) => const LoginView(),
          Routes.instance.otp: (context) => const OtpView(),
          Routes.instance.home: (context) => const HomeView(),
          Routes.instance.classList: (context) => const ClassList(),
          Routes.instance.classDetails: (context) => const ClassDetails(),
          Routes.instance.subletMemberListView: (context) =>
              const SubletMemberView(),
          Routes.instance.addProfile: (context) => const ProfileIntakeView(),
          // Routes.instance.driverInfoForm: (context) =>
          //     const DriverInfoIntakeForm(),
          Routes.instance.busTracker: (context)=> const BusTracker(),
          Routes.instance.helpingHandInfoForm: (context) =>
              const HelpingHandInfoIntakeForm(),
          Routes.instance.emergencyInfoForm: (context) =>
              const EmergencyContactInfoIntakeForm(),
          Routes.instance.memberInfoForm: (context) => const MemberAddForm(),
          Routes.instance.map: (context) => const MapLocationSelector(),
        },
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
