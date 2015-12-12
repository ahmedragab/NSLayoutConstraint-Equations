# NSLayoutConstraint-Equations

Swift library to create Auto Layout constraints programatically just like math equations and inequalities 

# Usage

``` swift

view.addConstraint(Top(label) == 1 * Top(button) + 20)

view.addConstraints(Top(label) == Top(button) |+ CenterX(label) == CenterX(self.view) |+ CenterY(label) == CenterY(self.view) |+ (Bottom(button) == Bottom(self.view) + 600)|10)

```

use the form Attribute1(Item1) == multiplier * Attribute2(Item2) + constant

# Attributes: 

Left
Right
Top
Bottom
Leading
Trailing
Width
Height
CenterX
CenterY
case Baseline
LastBaseline
FirstBaseline
LeftMargin
RightMargin
TopMargin
BottomMargin
LeadingMargin
TrailingMargin
CenterXWithinMargins
CenterYWithinMargins

you can append constraints using operator |+

also you can set priorities like (Constraint)|priority
