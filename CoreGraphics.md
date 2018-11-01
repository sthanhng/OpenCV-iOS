# Core Graphics

* Create date: 2018-11-01

## Gettting started

* The Core Graphics framework is based on the Quartz advanced drawing engine. it provides low-level, lightweight 2D rendering with unmatched output fidelity.

* You can use this framework to handle path-base drawing, transformations, color management, offscreen redering,...

## Topics

**Geometric Data types**

* struct CGFloat \
The basic type for floating-point scalar values in Core Graphic and related framework.
    
* struct CGPoint \
Contains a point in a 2-dimensional coordinate system.
    
* struct CGSize \
Contains width and height values.
    
* struct CGRect \
Contains the location and dimensions of a rectangle.
    
* struct CGAffineTransform \
An affine transformation matrix for use in drawing 2D graphics.


**2D drawing**

* class CGImage \
A bitmap image or image mask.

* class CGLayer \
An offscreen context for reusing content drawn with Core Graphics.

**Colors and Fonts**

* class CGColor \
A set of components that define a color, with a color space specifying how to interpret them.

* class CGColorSpace \
Specifies how to interpret a color value to display.

* class CGFont \
A set of character glyphs and layout information for drawing text.

>**Note**: For more details about Core Graphics framework you can find out [here](#ref).

## <a id="ref"></a>Reference

* https://developer.apple.com/documentation/coregraphics
