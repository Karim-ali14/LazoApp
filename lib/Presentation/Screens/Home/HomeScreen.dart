import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/InformationRowItem.dart';
import 'package:lazo_provider/Presentation/Widgets/AppButton.dart';

import '../../StateNotifier_ViewModel/UserAuthStateNotifiers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child:
        // AppButton(onPress: logout ,text: "Logout"),
        InformationRowItem(

        )
      ),
    ) ;
  }
  void logout() async {
    await ref.read(providerTokenStateProvider.notifier).logout();
    context.go(R_LoginScreen);
  }
}
