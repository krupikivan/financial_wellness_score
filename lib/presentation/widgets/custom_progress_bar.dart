import 'package:financial_wellness_score/presentation/widgets/inverted_corner_clipper.dart';
import 'package:financial_wellness_score/utils/enum.dart';
import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    super.key,
    required this.status,
    required this.color,
  });
  final FinancialStatus status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          // First Segment
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(50),
                  right: Radius.circular(50),
                ),
              ),
            ),
          ),
          // Second Segment
          Expanded(
            child: ClipPath(
              clipper: InvertedCornerClipper(),
              child: Container(
                decoration: BoxDecoration(
                  color: status == FinancialStatus.medium ||
                          status == FinancialStatus.healthy
                      ? color
                      : const Color(0xFFE9EEF2),
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(50),
                  ),
                ),
              ),
            ),
          ),
          // Third Segment
          Expanded(
            child: ClipPath(
              clipper: InvertedCornerClipper(),
              child: Container(
                decoration: BoxDecoration(
                  color: status == FinancialStatus.healthy
                      ? color
                      : const Color(0xFFE9EEF2),
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(50),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
