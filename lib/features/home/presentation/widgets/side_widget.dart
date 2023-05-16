import 'package:flutter/material.dart';

class SideWidget extends StatelessWidget {
  final String avatarImageUrl;

  const SideWidget({super.key, required this.avatarImageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(avatarImageUrl),
          radius: 20,
        ),
        const SizedBox(height: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(Icons.favorite, 0),
            _buildButton(Icons.comment, 0),
            _buildButton(Icons.share, 0),
            _buildButton(Icons.bookmark, 0),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(IconData icon, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          IconButton(
            color: Colors.white,
            icon: Icon(icon),
            onPressed: () {},
          ),
          const SizedBox(height: 2),
          Text(
            count.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
