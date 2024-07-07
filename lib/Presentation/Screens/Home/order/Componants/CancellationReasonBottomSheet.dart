import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants/Constants.dart';
import '../../../../../Data/Models/CancellationModel.dart';
import '../../../../Theme/AppTheme.dart';
import '../../../../Widgets/AppButton.dart';
import '../../../../Widgets/AppTextField.dart';
import '../../../../Widgets/SvgIcons.dart';

typedef OnSelectItemCallback = void Function(String);

class CancellationReasonBottomSheet extends StatefulWidget {
  final OnSelectItemCallback onSelectItemCallback;
  const CancellationReasonBottomSheet({super.key, required this.onSelectItemCallback});

  @override
  State<CancellationReasonBottomSheet> createState() => _CancellationReasonBottomSheetState();
}

class _CancellationReasonBottomSheetState extends State<CancellationReasonBottomSheet> {

  final cancellationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Stack(children: [
              Align(alignment : AlignmentDirectional.center ,child: Text("Reason for Reject")),
              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Align(alignment : AlignmentDirectional.centerEnd ,child: SVGIcons.closeSquareSvgIcon()))
            ]),
            const SizedBox(height: 32),
            Form(
              key: formKey,
              child: AppTextField(
                hint: "Enter cancellation reason",
                label: "Enter cancellation reason",
                textEditingController: cancellationController,
                mode: AutovalidateMode.onUserInteraction,
                validate: (value){
                  if(value?.isEmpty == true){
                    return "Enter your phone number or email address";
                  }else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            AppButton(
              height: 46,
              width: double.maxFinite,
              onPress: () {
                if (formKey.currentState?.validate() == true) {
                  widget.onSelectItemCallback.call(cancellationController.text);
                }
              },
              child: Text(
                "Send",
                style: AppTheme.styleWithTextWhiteAdelleSansExtendedFonts14w400,
              ),
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
