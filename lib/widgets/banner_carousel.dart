import 'dart:async';

import 'package:flowee_app/models/promo_banner.dart';
import 'package:flowee_app/widgets/banner_slide.dart';
import 'package:flowee_app/widgets/carousel_dots.dart';
import 'package:flutter/material.dart';

// carousel banner akan bergeser otomatis setiap beberapa detik untuk handilng timer seperti ini kita butuh peran stateful widget untuk melakukan perubahan widget pada layar
class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, required this.banners});

  final List<PromoBanner> banners;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  /**
   * PageController --> untuk mengatur slide mana yang sedang tampil di PageView --> class yang akan menampilkan banner kita
   */

  late final PageController _controller = PageController();
  Timer? _timer;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    // timer.periodic akan menjalankan funsi di dalamnya secara berulang2
    _timer = Timer.periodic(Duration(seconds: 4), (_) {
      if (!mounted || widget.banners.isEmpty) return;
      final next = (_page + 1) % widget.banners.length;
      _controller.animateToPage(
        next,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  /**
   * Timer HARUS di cancel saat widget di ahncurkan (saat di tampilkan di laayar), Kalau lupa timwer akan
   * terus berjalan di laatr belakang background walau carousel nya sudah tidak muncul di alayr ini salah satu penyebab umum memmory leak di flutter
   */
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        SizedBox(
          height: 168,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.banners.length,
            /**
             * dipanggil juga saaat pengguna swipe manual, bukan hanya saat di geser otomatis oleh timer
             * supaya titik indikator di bawa selalu sinkron dengam slide yang benar benar tampil.
             */
            onPageChanged: (index) => setState(() => _page = index),
            itemBuilder: (context, index) =>
                BannerSlide(banner: widget.banners[index]),
          ),
        ),
        SizedBox(height: 10),
        CarouselDots(
          count: widget.banners.length,
          activeIndex: _page,
          activeColor: widget.banners[_page].gradientColors.first,
        ),
      ],
    );
  }
}
