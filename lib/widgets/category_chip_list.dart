import 'package:flowee_app/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//menampilkan sesuatu
class CategoryChipList extends StatelessWidget {
  const CategoryChipList({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  final List<String> categories;
  //kepilih kategorinya:
  final String selectedCategory;
  // state kalau dia ke pilih:
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    // Wrap sama kayak kasih padding dan margin
    return SizedBox(
      height: 36,
      // ini semua sebuah list, kenapa separated karena dia bunya action beda-beda makanya pake ini: tetep satu list yang sama
      child: ListView.separated(
        //untuk menjawab pertanyaan, berapa banyak yang mau di tampilkan,abil dari data dummy
        itemCount: categories.length,
        //pemisah list nya biasanya garis atau apapun itu (untuk jarak)
        separatorBuilder: (_, _) => SizedBox(width: 8),
        // definisi item builder
        itemBuilder: (context, index) {
          // menampilkan category berdasarkan index
          final category = categories[index];
          // menyamakan jika terpilih jadi sama category dan selected categorynya
          final isSelected = category == selectedCategory;
          // label : string yang akan di tampilkan contoh : semua, bunga potong, dll
          return ChoiceChip(
            label: Text(category),
            selected: isSelected,
            // kalau udah kepilih apa yang akan di lakukan
            onSelected: (_) => onSelected(category),
            // TODO - Defining on selected action
            selectedColor: AppTheme.primary, //kalau dia kepilih bg nya ini
            showCheckmark: false,
            labelStyle: TextStyle(
              //karena kalau dia belum kepilih teksnya hitam
              color: isSelected ? Colors.white : AppTheme.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            // for the color BG
            backgroundColor: isSelected ? AppTheme.primary :AppTheme.primarySoft.withValues(alpha: 0.5),
            side: BorderSide.none,
            elevation: 0,
            pressElevation: 0, //efek apa yang akan di lakukan kalau ga di klik dan di klik
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        },
      ),
    );
  }
}
