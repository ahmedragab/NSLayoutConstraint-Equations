//
//  NSLayoutConstraint+Equations.swift
//  NSLayoutConstraint+Equations
//
//  Created by Ahmed Ragab on 12/12/15.
//  Copyright © 2015 QuaNode. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

public protocol QNLayoutConstraintOperand {
    
    var item : AnyObject { get }
    var attribute : NSLayoutAttribute { get }
    var multiplier : CGFloat { set get }
    var constant : CGFloat { set get }
}

public class QNLayoutAttribute : QNLayoutConstraintOperand {
    
    var _item : AnyObject
    var _multiplier : CGFloat = 1
    var _constant : CGFloat = 0
    public var item : AnyObject {
        
        return _item
    }
    public var attribute : NSLayoutAttribute {
    
        return NSLayoutAttribute.NotAnAttribute
    }
    public var multiplier : CGFloat {
    
        set {

            _multiplier = newValue
        }
        get {

            return _multiplier
        }
    }
    public var constant : CGFloat {
        
        set {
            
            _constant = newValue
        }
        get {
            
            return _constant
        }
    }
    init(_ anyItem:AnyObject){
        
        _item = anyItem
    }
}

public class Left : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.Left
    }
}

public class Right : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.Right
    }
}

public class Top : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.Top
    }
}

public class Bottom : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.Bottom
    }
}

public class Leading : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.Leading
    }
}

public class Trailing : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.Trailing
    }
}

public class Width : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.Width
    }
}

public class Height : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.Height
    }
}

public class CenterX : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.CenterX
    }
}

public class CenterY : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.CenterY
    }
}

public class Baseline : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.Baseline
    }
}

public class LastBaseline : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.LastBaseline
    }
}

public class FirstBaseline : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.FirstBaseline
    }
}

#if os(iOS)
    
public class LeftMargin : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.LeftMargin
    }
}

public class RightMargin : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.RightMargin
    }
}

public class TopMargin : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.TopMargin
    }
}

public class BottomMargin : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.BottomMargin
    }
}

public class LeadingMargin : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.LeadingMargin
    }
}

public class TrailingMargin : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.TrailingMargin
    }
}

public class CenterXWithinMargins : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.CenterXWithinMargins
    }
}

public class CenterYWithinMargins : QNLayoutAttribute {
    
    override public var attribute : NSLayoutAttribute {
        
        return NSLayoutAttribute.CenterYWithinMargins
    }
}
    
#endif

public func * (left : CGFloat, var right : QNLayoutConstraintOperand) -> QNLayoutConstraintOperand {
    
    right.multiplier = left
    return right
}

public func * (left : QNLayoutConstraintOperand, right : CGFloat) -> QNLayoutConstraintOperand {
    
    return right * left
}

public func + (var left : QNLayoutConstraintOperand, right : CGFloat) -> QNLayoutConstraintOperand {
    
    left.constant = right
    return left
}

public func + (left : CGFloat, right : QNLayoutConstraintOperand) -> QNLayoutConstraintOperand {
    
    return right + left
}

public func == (left : QNLayoutConstraintOperand, right : QNLayoutConstraintOperand) -> NSLayoutConstraint {
    
    return NSLayoutConstraint(item: left.item, attribute: left.attribute, relatedBy: NSLayoutRelation.Equal, toItem: right.item, attribute: right.attribute, multiplier: right.multiplier, constant: right.constant)
}

public func == (left : QNLayoutConstraintOperand, right : CGFloat) -> NSLayoutConstraint {
    
    return NSLayoutConstraint(item: left.item, attribute: left.attribute, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 0, constant: right)
}

public func == (left : CGFloat, right : QNLayoutConstraintOperand) -> NSLayoutConstraint {
    
    return NSLayoutConstraint(item: right.item, attribute: right.attribute, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 0, constant: left)
}

public func <= (left : QNLayoutConstraintOperand, right : QNLayoutConstraintOperand) -> NSLayoutConstraint {
    
    return NSLayoutConstraint(item: left.item, attribute: left.attribute, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: right.item, attribute: right.attribute, multiplier: right.multiplier, constant: right.constant)
}

public func <= (left : QNLayoutConstraintOperand, right : CGFloat) -> NSLayoutConstraint {
    
    return NSLayoutConstraint(item: left.item, attribute: left.attribute, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 0, constant: right)
}

public func <= (left : CGFloat, right : QNLayoutConstraintOperand) -> NSLayoutConstraint {
    
    return NSLayoutConstraint(item: right.item, attribute: right.attribute, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 0, constant: left)
}

public func >= (left : QNLayoutConstraintOperand, right : QNLayoutConstraintOperand) -> NSLayoutConstraint {
    
    return NSLayoutConstraint(item: left.item, attribute: left.attribute, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: right.item, attribute: right.attribute, multiplier: right.multiplier, constant: right.constant)
}

public func >= (left : QNLayoutConstraintOperand, right : CGFloat) -> NSLayoutConstraint {
    
    return NSLayoutConstraint(item: left.item, attribute: left.attribute, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 0, constant: right)
}

public func >= (left : CGFloat, right : QNLayoutConstraintOperand) -> NSLayoutConstraint {
    
    return NSLayoutConstraint(item: right.item, attribute: right.attribute, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 0, constant: left)
}

infix operator |+ { associativity left precedence 0}

func |+ (left : NSLayoutConstraint, right : NSLayoutConstraint) -> [NSLayoutConstraint] {
    
    return [left, right]
}

func |+ (var left : [NSLayoutConstraint], right : NSLayoutConstraint) -> [NSLayoutConstraint] {
    
    left.append(right)
    return left
}

func | (left : NSLayoutConstraint, right : UILayoutPriority) -> NSLayoutConstraint {
    
    left.priority = right
    return left
}