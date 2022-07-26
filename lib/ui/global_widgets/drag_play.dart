import 'package:flutter/material.dart';

class DragPlay extends StatefulWidget {
  final Widget child;

  const DragPlay({Key? key, required this.child}) : super(key: key);

  @override
  _DragPlayStateStateful createState() => _DragPlayStateStateful();
}

class _DragPlayStateStateful extends State<DragPlay> {
  Offset position = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: position.dx,
            top: position.dy,
            width: 100,
            height: 100,
            child: LongPressDraggable(
              feedback: widget.child,
              childWhenDragging: Opacity(
                opacity: 1,
                child: widget.child,
              ),
              onDragEnd: (details) => setState(() => position = details.offset),
              child: widget.child,
            ))
      ],
    );
  }
}
