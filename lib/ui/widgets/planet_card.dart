import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/planet.dart';

class PlanetCard extends StatelessWidget {
  final Planet planet;
  final bool isLiked;
  final VoidCallback onLikeTap;

  const PlanetCard({
    super.key,
    required this.planet,
    required this.isLiked,
    required this.onLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: 'planet_cover_${planet.id}',
            child: Container(
              width: 88,
              height: 120,
              decoration: BoxDecoration(
                color: planet.color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  planet.letter,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  planet.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  planet.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFCFE2F3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        planet.category.name,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E3A5F),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onLikeTap,
            child: AnimatedScale(
              scale: isLiked ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.grey,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}