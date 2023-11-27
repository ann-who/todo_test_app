import 'package:flutter/material.dart';

class SettingBodyWidget extends StatefulWidget {
  final String title;
  final List<String> items;
  final String selectedVariant;
  final Function(String value) onSelected;

  const SettingBodyWidget({
    super.key,
    required this.title,
    required this.items,
    required this.selectedVariant,
    required this.onSelected,
  });

  @override
  State<SettingBodyWidget> createState() => _SettingBodyWidgetState();
}

class _SettingBodyWidgetState extends State<SettingBodyWidget>
    with SingleTickerProviderStateMixin {
  bool _isToggled = false;
  late AnimationController _expandController;
  late Animation<double> _animation;

  @override
  void initState() {
    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.easeInOut,
    );

    super.initState();
  }

  void _animate() {
    if (_isToggled) {
      _expandController.forward();
    } else {
      _expandController.reverse();
    }
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            setState(() {
              _isToggled = !_isToggled;
            });
            _animate();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(widget.title, style: textTheme.bodyLarge),
                const Spacer(),
                Text(
                  widget.selectedVariant,
                  style: textTheme.bodyLarge!.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        SizeTransition(
          axisAlignment: 1.0,
          sizeFactor: _animation,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.items.length,
              itemBuilder: (context, index) => Row(
                children: [
                  Checkbox(
                    value: widget.items[index] == widget.selectedVariant,
                    onChanged: (value) => widget.onSelected(
                      widget.items[index],
                    ),
                  ),
                  Text(widget.items[index]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
