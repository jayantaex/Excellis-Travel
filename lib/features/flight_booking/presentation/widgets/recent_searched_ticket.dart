import 'package:flutter/material.dart';

class RecentSearchedTicket extends StatelessWidget {
  const RecentSearchedTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildFlightInfoRow(),
            const Divider(height: 32),
            _buildDetailsRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildFlightInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAirportCodeColumn("CGK", "Jul 14, 2025"),
        const Column(
          children: [
            Row(
              children: [
                Icon(Icons.circle, size: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Icon(Icons.flight_takeoff, size: 20),
                ),
                Icon(Icons.circle, size: 8),
              ],
            ),
            SizedBox(height: 4),
            Text(
              "1h 50m",
            ),
          ],
        ),
        _buildAirportCodeColumn("SIN", "Jul 14, 2025"),
        _buildBestPriceBadge(),
      ],
    );
  }

  Widget _buildAirportCodeColumn(String code, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          code,
        ),
        const SizedBox(height: 4),
        Text(
          date,
        ),
      ],
    );
  }

  Widget _buildBestPriceBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        "Best Price",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.brown[700],
        ),
      ),
    );
  }

  Widget _buildDetailsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLabelValue("Seat Class", "Business Class"),
        _buildLabelValue("Cost", "₹510"),
      ],
    );
  }

  Widget _buildLabelValue(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const notchRadius = 10.0;
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height / 2 - notchRadius);
    path.arcToPoint(
      Offset(0, size.height / 2 + notchRadius),
      radius: const Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 2 + notchRadius);
    path.arcToPoint(
      Offset(size.width, size.height / 2 - notchRadius),
      radius: const Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
