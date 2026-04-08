import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleX = size.width / 430;
    final scaleY = size.height / 932;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.6, -0.8),
            end: Alignment(0.6, 0.8),
            stops: [0.0, 0.67],
            colors: [
              Color(0xFFFF939B),
              Color(0xFFEF2A39),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Título Foodgo
            Positioned(
              left: 129 * scaleX,
              top: 282 * scaleY,
              child: Text(
                'Foodgo',
                style: GoogleFonts.lobster(
                  fontSize: 60 * scaleX,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  height: 1.25,
                ),
              ),
            ),

            // Imagen de fondo (bottom left, parcialmente fuera)
            Positioned(
              left: -42 * scaleX,
              top: 681 * scaleY,
              child: Image.asset(
                'assets/images/splash_food1.png',
                width: 246 * scaleX,
                height: 288 * scaleY,
                fit: BoxFit.cover,
              ),
            ),

            // Sombra blur detrás de imagen principal
            Positioned(
              left: 149 * scaleX,
              top: 798 * scaleY,
              child: Container(
                width: 42 * scaleX,
                height: 138 * scaleY,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(21),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.6),
                      blurRadius: 21,
                      spreadRadius: 10,
                    ),
                  ],
                ),
              ),
            ),

            // Imagen principal del producto
            Positioned(
              left: 134 * scaleX,
              top: 758 * scaleY,
              child: Image.asset(
                'assets/images/splash_food2.png',
                width: 202 * scaleX,
                height: 202 * scaleY,
                fit: BoxFit.cover,
              ),
            ),

            // Sombra elipse inferior
            Positioned(
              left: 222 * scaleX,
              top: 924 * scaleY,
              child: Container(
                width: 108 * scaleX,
                height: 12 * scaleY,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
