import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Theme/AppTheme.dart';

typedef StringCallBack = Function(String);

class AppTextField extends StatefulWidget {
  final String hint;
  final String? label;
  final StringCallBack? value;
  final StringCallBack? changeValueCallback;
  final TextEditingController textEditingController;
  final double? width;
  final BorderRadius? borderRidus;
  final Color? textFieldColor;
  final Color? textFieldBorderColor;
  final TextInputType? textInputType;
  final bool? secured;
  final int? minLines;
  final int? maxLines;
  final int? maxLen;
  final bool? disabled;
  final VoidCallback? onClick;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final String? endText;
  final String? Function(String?)? validate;
  final Widget? endWidget;
  final Widget? startWidget;
  final TextInputFormatter? mask;
  final AutovalidateMode? mode;
  const AppTextField(
      {super.key,
        required this.hint,
        this.borderRidus,
        this.secured = false,
        this.textInputType,
        this.width,
        required this.label,
        this.value,
        this.style,
        this.minLines,
        this.maxLines,
        this.maxLen,
        this.changeValueCallback,
        this.mask,
        this.endWidget,this.startWidget,
        required this.textEditingController,
        this.textFieldColor, this.textInputAction, this.textFieldBorderColor, this.disabled, this.onClick, this.endText, this.validate, this.mode, });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _visiblePassword = false;


  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: widget.onClick,
      child: SizedBox(
        width: widget.width,
        child:TextFormField(
          autovalidateMode: widget.mode,
            inputFormatters: widget.mask != null ? [widget.mask!] : null,
            onTapOutside: (val){
              FocusManager.instance.primaryFocus?.unfocus();
            },
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            controller: widget.textEditingController,
            textAlign: widget.maxLen != null ? TextAlign.center : TextAlign.start,
            obscureText: (!_visiblePassword && widget.secured!),
            onChanged: (val) {
              if(widget.changeValueCallback != null){
                widget.changeValueCallback!(val);
              }
            },
            validator: widget.validate,
            minLines: widget.minLines,
            maxLength: widget.maxLen,
            maxLines: widget.secured == true ? 1 : widget.maxLines,
            onFieldSubmitted: (val) =>  widget.value!(val),
            readOnly: !(widget.disabled != null ? (!widget.disabled!) : true),
            style: widget.style ?? TextStyle(color: widget.disabled == true ? const Color(0xFF8088A4) : Theme.of(context).textTheme.bodyLarge!.color,fontSize: 14),
            decoration: InputDecoration(
                suffixText: widget.endText,
                labelText: widget.label ?? "",
                hintText: widget.hint,
                alignLabelWithHint: true,
                prefixIcon: widget.startWidget,
                suffixIcon:  widget.secured!
                    ? IconButton(
                  onPressed: () => setState(() => _visiblePassword = !_visiblePassword),
                  icon: Icon(_visiblePassword ? Icons.visibility_off : Icons.visibility),color: Colors.grey,)
                    : widget.endWidget,
                labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w100,
                    color: Theme.of(context).textTheme.bodyLarge!.color),
                focusedBorder: getBorder,
                errorBorder: getErrBorder,
                focusedErrorBorder: getErrBorder,
                enabledBorder: getBorder,
                disabledBorder: getBorder,
                errorStyle: AppTheme.appTextTheme.titleMedium?.copyWith(color: Colors.red),
                filled: true,
                counter: const SizedBox(),
                enabled: true,
                fillColor: widget.textFieldColor??themeData.appBarTheme.backgroundColor)),
      ),
    );
  }

  InputBorder get getBorder => widget.textFieldBorderColor == null ?  OutlineInputBorder(
    borderSide: BorderSide(color: widget.textFieldBorderColor??AppTheme.appGrey3),
    borderRadius: widget.borderRidus?? BorderRadius.circular(4),
  ) : UnderlineInputBorder(
    borderSide: const BorderSide(color:AppTheme.appGrey3),
    borderRadius: widget.borderRidus?? BorderRadius.circular(4),
  );

  InputBorder get getErrBorder => widget.textFieldBorderColor == null ?  OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
    borderRadius: widget.borderRidus?? BorderRadius.circular(4),
  ) : UnderlineInputBorder(
    borderSide: const BorderSide(color:AppTheme.appGrey3),
    borderRadius: widget.borderRidus?? BorderRadius.circular(4),
  );
}

class TextFormatters {
  static FilteringTextInputFormatter onlyLetters = FilteringTextInputFormatter.allow(RegExp('[a-z A-Z ا-ي]'));
  static FilteringTextInputFormatter nonStartingZero =  FilteringTextInputFormatter.deny(RegExp(r'^0+'),);
  static FilteringTextInputFormatter nonArabicPhone =  FilteringTextInputFormatter.allow(RegExp('[0-9]'),);
}