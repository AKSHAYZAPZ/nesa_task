import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nesa_machine_test/config/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;

  final Color? color;
  final Color? textColor;

  final void Function()? onTap;
  final bool? isLoading;
  final Widget? prefixIcon;

  const AppButton({
    super.key,
    required this.text,
    this.height,
    this.onTap,
    this.color,
    this.width,
    this.textColor,
    this.isLoading,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: height ?? 90,
        width: width,
        child: GestureDetector(
          onTap: (isLoading ?? false) ? null : onTap,
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: (isLoading ?? false) ? height ?? 55 : height ?? 55,
              width: (isLoading ?? false) ? 55 : width,
              decoration: BoxDecoration(
                color: color ?? AppColors.purple,
                borderRadius: BorderRadius.circular(
                  (isLoading ?? false) ? 58 : 14 ?? 8,
                ),
              ),
              child: Center(
                child: isLoading ?? false
                    ? CircularProgressIndicator(color: AppColors.white)
                    : Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          prefixIcon ?? const SizedBox(width: 0),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: textColor ?? AppColors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
