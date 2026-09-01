import 'package:flutter/material.dart';

/**
 * untuk menampilkan gamabr url internet
 * 1. sedang di muat: menampilkan indikator loading 
 * 2. ketika kondisi gagal di muat: menampilkan icon pengganti
 */
class FlowerNetworkImage extends StatelessWidget {
  const FlowerNetworkImage({
    super.key,
    required this.imageURL,
    required this.fallbackIcon,
    required this.fallbackColor,
    required this.fit,
  });

  final String imageURL;
  final IconData fallbackIcon;
  final Color fallbackColor;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageURL,
      fit: fit,
      width: double.infinity,
      height: double.infinity,

      // loading indicator, yang akan di jalankan terus menurus oleh flutter selama gmbar masih proses download dari internet
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return _Placeholder(
          color: fallbackColor,
          child: SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2.2,
              color: fallbackColor,
              //  kalau flutter tau total file, maka akan menghitung proses download gambar
              // kalau flutter tidak tau ukuran file maka akan mengembalikan null
              value: progress.expectedTotalBytes != null
                  ? progress.cumulativeBytesLoaded /
                        progress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      // eror builder yang akan di panggil jika proses di atas (loading gambar) GATOT
      errorBuilder: (context, error, stackTrace) {
        return _Placeholder(
          color: fallbackColor,
          child: Icon(fallbackIcon, size: 48, color: fallbackColor),
        );
      }, 
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.color, required this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.withValues(alpha: 0.18),
      alignment: Alignment.center,
      child: child,
    );
  }
}
