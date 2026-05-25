import 'package:flutter/material.dart';
import 'package:calories_fix/core/theme/app_colors.dart';

class FavoriteButton extends StatefulWidget {
  final Function(bool)? onFavoriteChanged;
  final double size;

  const FavoriteButton({super.key, this.onFavoriteChanged, this.size = 20});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        // استدعاء الوظيفة الخارجية إذا كانت موجودة
        if (widget.onFavoriteChanged != null) {
          widget.onFavoriteChanged!(isFavorite);
        }
      },
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : AppColors.textColorDark,
        size: widget.size,
      ),
    );
  }
}
