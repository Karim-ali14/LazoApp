import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants.dart';
import 'package:lazo_provider/Presentation/Screens/More/Balance/Widgets/TransactionItem.dart';
import 'package:lazo_provider/Presentation/StateNotifier_ViewModel/TransactionStateNotifiers.dart';
import 'package:lazo_provider/Presentation/Widgets/DataListView.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../Data/Models/StateModel.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../../Localization/keys.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/CustomAppBar.dart';
import '../../../Widgets/SvgIcons.dart';
// 53605356088
class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({super.key});

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {

  var currentPage = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getTransactions();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final transactions = ref.watch(transactionStateProvider);

    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: context.tr(balanceKey),
        isCenter: false,
        navigated: true,
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 72,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.mainAppColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  SVGIcons.walletWithWhiteBackgroundIcon(),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr(walletBalanceKey),
                        style: AppTheme
                            .styleWithTextWhiteAdelleSansExtendedFonts12w400,
                      ),
                      const Spacer(),
                      Text(
                        "${transactions.data?.data?.currentBalance ?? 0} ${context.tr(SARKey)}",
                        style: AppTheme
                            .styleWithTextWhiteAdelleSansExtendedFonts20w700,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,),
            Expanded(
              child: DataListView<TransactionDetails>(
                dataList: transactions.data?.data?.transactions?.data ??
                    (transactions.state == DataState.LOADING
                        ? [
                      ...List.generate(
                          5, (index) => TransactionDetails())
                    ]
                        : []), paginated: true,
                  pageLoading: currentPage <
                      (transactions.data?.data?.transactions?.lastPage ?? 0)
                , onBottomReached: () {
                if (currentPage <
                    (transactions.data?.data?.transactions?.lastPage ?? 0)) {
                  ref
                      .read(transactionStateProvider.notifier)
                      .getTransactions(page: (++currentPage).toString());
                }
              }, builder: (TransactionDetails item) {
                  return Skeletonizer(
                      enabled: transactions.state == DataState.LOADING,
                      child: TransactionItem(transaction: item, itemClick: (link) {
                        navigateToFileViewer(link);
                      },));
                }),
            )
          ],
        ),
      ))
    );
  }

  void getTransactions() {
    ref.read(transactionStateProvider.notifier).getTransactions();
  }

  void navigateToFileViewer(String? link) {
    context.push(R_FileViewerScreen,extra: {fileUrlKey : link});
  }

}
