import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:player_exchange/utils/color_manager.dart';

/*
class CustomTextField extends StatelessWidget{
  String? title;
  String? hint;
  TextEditingController? textEditingController;
  final bool allowValidation;
  final String Function(String?)? onChange;
  final int maxLine;
  final int minLine;
  final String Function(String?)? validator;
  final double verticalPadding;


  CustomTextField({this.hint="",this.title="",@required this.textEditingController, this.allowValidation = true,
    this.onChange,
    this.maxLine=1,
    this.minLine=1,
    this.verticalPadding = 0,
    this.validator,});

  @override
  Widget build(BuildContext context) {

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(1),
      borderSide: BorderSide(color: Colors.grey),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title!,style:TextStyle(color: Colors.grey) ,),
        TextFormField(
          controller: textEditingController,
          validator:validator == null?  allowValidation
              ? (txt) {
            if (txt!.isEmpty) return 'Fill this field';
            return null;
          }
              : null: validator,
          autocorrect: false,
          enableSuggestions: false,
          //keyboardType: TextInputType.visiblePassword,
          onChanged: onChange,
          maxLines: maxLine != null ? maxLine : 1,
          minLines: maxLine != null ? maxLine : 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal:ScreenUtil().setWidth(10),
                vertical:  ScreenUtil().setWidth(10)),
            hintText: hint,
            border: border,
            focusedBorder: border,
          ),
        )
      ],
    );
  }

}*/

class CustomTextField extends StatefulWidget {
  String? hintText;
  TextEditingController controller;
  TextInputType keyboardType;
  Function? onTap;
  Widget? suffix;
  Widget? prefix;
  bool isPasswordfield;
  bool isEnable;
  double? height;
  double bottomPadding;
  Function(String)? onChange;
  Function(String)? onFieldsubmit;

  final String Function(String?)? validator;
  final bool allowValidation;

  bool passwordState;
  List<TextInputFormatter>? inputFormatter;
  TextInputAction? textInputAction;
  bool isTransparentDisableFieldColor;
  String Function(String)? validationFunction;
  int maxlines;
  FocusNode? focusNode;
  bool readonly;
  bool isRoundedCorner;

  CustomTextField(
      {required this.controller,
      this.hintText,
      this.validator,
      this.allowValidation = false,
      //this.onSaved,
      this.onFieldsubmit,
      this.bottomPadding = 0.0,
      this.onChange,
      this.inputFormatter,
      this.keyboardType = TextInputType.text,
      this.onTap,
      this.suffix,
      this.isTransparentDisableFieldColor = false,
      this.prefix,
      this.isPasswordfield = false,
      this.height,
      this.passwordState = false,
      this.isEnable = true,
      this.validationFunction,
      this.textInputAction,
      this.maxlines = 1,
      this.focusNode,
      this.readonly = false,
      this.isRoundedCorner = true});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height == null ? 40.h : widget.height,
      decoration: BoxDecoration(
          color: ColorManager.buttonGreyColor,
          //border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(
              Radius.circular(widget.isRoundedCorner ? 10.h : 5))),
      child: Row(
        children: [
          Flexible(
            child: TextSelectionTheme(
              data: const TextSelectionThemeData(
                cursorColor: ColorManager.greenColor,
              ),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  focusNode: widget.focusNode,

                  readOnly: widget.readonly == null
                      ? false
                      : widget.readonly
                          ? true
                          : false,
                  textAlignVertical: TextAlignVertical.top,
                  // autofocus: true,
                  onChanged: (val) {
                    if (widget.onChange != null) {
                      widget.onChange;
                    }
                  },

                  onFieldSubmitted: widget.onFieldsubmit,
                  inputFormatters: widget.keyboardType == TextInputType.number
                      ? [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,4}')),
                        ]
                      : widget.inputFormatter,
                  maxLines: widget.maxlines != null ? widget.maxlines : 1,
                  textAlign: TextAlign.justify,
                  enabled: widget.isEnable == null ? true : widget.isEnable,
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  obscureText: widget.passwordState ? true : false,

                  textInputAction: widget.textInputAction,
                  decoration: InputDecoration(
                    isDense: true,
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 8.0, end: widget.suffix == null ? 0 : 5),
                      child: widget.suffix == null
                          ? Container(
                              width: 0,
                              height: 0,
                            )
                          : widget.suffix,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 8.0, end: widget.prefix == null ? 0 : 5),
                      child: widget.prefix == null
                          ? Container(
                              width: 0,
                              height: 0,
                            )
                          : widget.prefix,
                    ),
                    suffixIconConstraints: BoxConstraints(
                        maxWidth: double.infinity,
                        maxHeight: widget.suffix == null ? 0 : 30.h),

                    prefixIconConstraints: BoxConstraints(
                        maxWidth: double.infinity,
                        maxHeight: widget.prefix == null ? 0 : 30.h),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: widget.hintText,
                    //hintStyle: TextStyle(fontWeight: AppTextWeight.appDefaultTextWeight, fontSize: AppTextSizes.appDefaultTextSize),

                    // contentPadding: EdgeInsets.symmetric(horizontal:10.w,vertical: 5.w)
                  ),
                  validator: widget.validator == null
                      ? widget.allowValidation
                          ? (txt) {
                              if (txt!.isEmpty) return 'Fill this field';
                              return null;
                            }
                          : null
                      : widget.validator,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
