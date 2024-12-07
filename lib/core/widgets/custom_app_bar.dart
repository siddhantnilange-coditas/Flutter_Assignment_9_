
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget {
    const CustomAppBar({super.key, this.preferredHeight = kToolbarHeight});

    final double preferredHeight;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 117),
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
    @override
  Size get preferredSize =>Size.fromHeight(preferredHeight);
}