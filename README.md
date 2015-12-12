# NSLayoutConstraint-Equations

Swift library to create Auto Layout constraints programatically just like math equations and inequalities 

# Usage

``` swift

view.addConstraint(Top(label) == 1 * Top(button) + 20)

view.addConstraints(Top(label) == Top(button) |+ CenterX(label) == CenterX(self.view) |+ CenterY(label) == CenterY(self.view) |+ (Bottom(button) == Bottom(self.view) + 600)|10)

```

use the form Attribute1(Item1) == or >= or <= multiplier * Attribute2(Item2) + constant
you can append constraints using |+
also you can set priorities like (Constraint)|priority
