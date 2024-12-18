import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lazo_provider/Data/Network/lib/api.dart';
import 'package:lazo_provider/Localization/Keys.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Utils/DateUtils.dart';
import 'package:lazo_provider/Utils/Extintions.dart';
// 525252520
class TransactionItem extends StatelessWidget {
  final TransactionDetails transaction;

  TransactionItem({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.appGrey8, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Transaction ID and Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID: ${transaction.id}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    transaction.status == 'Income' ? 'Sender Name' : 'Admin',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Date: ${transaction.createdAt?.ddMmYyyy()}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children:[
                      Text(
                        'State: ${transaction.status}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ]
                  ),
                ],
              ),
              // Spacer between columns
              Spacer(),
              // Amount and View Report Button
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${transaction.amount} ${context.tr(SARKey)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: transaction.status == 'Income' ? AppTheme.green : AppTheme.mainAppColor,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Text(
                    'View Report',
                    style: AppTheme
                        .styleWithTextMainAppColorAdelleSansExtendedFonts10w400.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
