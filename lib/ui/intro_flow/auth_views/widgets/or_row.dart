import 'package:calories_fix/core/extensions/responsive_sized_box_extension.dart';
import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class OrRow extends StatelessWidget {
  const OrRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.textColorDark,
            thickness: 2,
          ),
        ),
        10.horizontalSizedBox,
        Text(
          AppLocalizations.of(context)!.or,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: AppColors.textColorDark,
          ),
        ),
        10.horizontalSizedBox,
        Expanded(
          child: Divider(
            color: AppColors.textColorDark,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
