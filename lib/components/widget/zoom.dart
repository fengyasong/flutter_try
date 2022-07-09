import 'package:flutter/material.dart';

class Zoom extends StatefulWidget {
  const Zoom({Key? key,required this.child,this.magnification=2}) : super(key: key);

  final Widget child;
  final double magnification;

  @override
  _ZoomState createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
  Offset? _offset ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        widget.child,
        Positioned.fill(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final Size childSize = constraints.biggest;
            return MouseRegion(
              onHover: (PointerEvent event) {
                setState(() {
                  _offset = event.localPosition;
                });
              },
              onExit: (PointerEvent event) {
                setState(() {
                  _offset = null;
                });
              },
              child: _offset==null?null:_buildZoomedChild(_offset!.dx,_offset!.dy,childSize),
            );
          },
        ))
      ],
    );
  }
  
  Widget _buildZoomedChild(double dx,double dy,Size childSize) {
    // final magnifierSize=childSize.shortestSide/2;
    final magnifierSize=150.0;
    return Transform.translate(
      offset: Offset(dx-magnifierSize/2,dy-magnifierSize/2),
      child: Align(
        alignment:Alignment.topLeft,
        child: Stack(
          children: [
            SizedBox(
              width: magnifierSize,
              height: magnifierSize,
              child: ClipOval(
                child:Transform.scale(
                  scale: widget.magnification,
                  child: Transform.translate(
                    offset: Offset(childSize.width/2-dx,childSize.height/2-dy),
                    child: OverflowBox(
                      minWidth: childSize.width,
                      minHeight: childSize.height,
                      maxWidth: childSize.width,
                      maxHeight: childSize.height,
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(magnifierSize),
                border: Border.all(color: Colors.black,width: 1),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
