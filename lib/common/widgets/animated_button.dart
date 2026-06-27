import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? borderColor;
  final double? width;
  final double height;
  final double borderRadius;
  final IconData? icon;
  final bool isLoading;
  final double? fontSize;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFE53935),
    this.foregroundColor = Colors.white,
    this.borderColor,
    this.width,
    this.height = 54,
    this.borderRadius = 16,
    this.icon,
    this.isLoading = false,
    this.fontSize,
  });

  const AnimatedButton.text({
    super.key,
    required this.text,
    required this.onPressed,
    this.foregroundColor = Colors.white,
    this.width,
    this.height = 44,
    this.borderRadius = 16,
    this.icon,
    this.isLoading = false,
    this.fontSize,
  }) : backgroundColor = Colors.transparent,
       borderColor = null;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasBorder = widget.borderColor != null;

    final button = SizedBox(
      width: widget.width,
      height: widget.height,
      child: Material(
        color: hasBorder ? Colors.transparent : widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          onTap: widget.isLoading ? null : widget.onPressed,
          child: Container(
            decoration: hasBorder
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    border: Border.all(
                      color: widget.borderColor!,
                      width: 1.5,
                    ),
                  )
                : null,
            alignment: Alignment.center,
            child: widget.isLoading
                ? SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          widget.foregroundColor),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.icon != null) ...[
                        Icon(widget.icon, color: widget.foregroundColor, size: 20),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        widget.text,
                        style: TextStyle(
                          color: widget.foregroundColor,
                          fontSize: widget.fontSize ?? 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );

    return Listener(
      onPointerDown: (_) => _controller.forward(),
      onPointerUp: (_) => _controller.reverse(),
      onPointerCancel: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) => Transform.scale(
          scale: _animation.value,
          child: child,
        ),
        child: button,
      ),
    );
  }
}
