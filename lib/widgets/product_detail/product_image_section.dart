import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../config/theme/app_colors.dart';

class ProductImageSection extends StatelessWidget {
  final List<String> images;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const ProductImageSection({
    super.key,
    required this.images,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 260,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF2F2F2),
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: images[selectedIndex],
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(strokeWidth: 2)),
                errorWidget: (context, url, error) =>
                    Icon(Icons.broken_image, size: 50, color: AppColors.grey),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          children: List.generate(images.length, (index) {
            final isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () => onSelect(index),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? AppColors.purple : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                        images[index],
                      ),
                    ))),
              ),
            );
          }),
        ),
      ],
    );
  }
}
