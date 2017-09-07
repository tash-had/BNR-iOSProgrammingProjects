//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Tash-had Saqif on 2017-09-04.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView ()
@property (strong, nonatomic) UIColor *circleColor;

@end
@implementation BNRHypnosisView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
//    // Add in BNR Logo
//    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
//    [logoImage drawInRect:rect];
    
    // Figure out the center of the bounds rect
    CGPoint center;
    center.x = bounds.origin.x + (bounds.size.width/2.0);
    center.y = bounds.origin.y + (bounds.size.height/2.0);
    
    // The circle will be the largest that will fit in the view
//    float radius = (MIN(bounds.size.width, bounds.size.height)/2);
    // The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/2;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    for  (float currentRad = maxRadius; currentRad > 0; currentRad -=20){
        [path moveToPoint:CGPointMake(center.x + currentRad, center.y)];
            [path addArcWithCenter:center radius:currentRad startAngle:0 endAngle:2*M_PI clockwise:YES];
    }
    

    //    [path addArcWithCenter:center radius:radius startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    // Configure line width
    path.lineWidth = 10.0;
    [self.circleColor setStroke];
    [path stroke];
    
}

- (void)setCircleColor:(UIColor *)circleColor{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    // All BNRHypnosisViews start w. a clear background color
    if (self){
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@ was touched", self);
    float red = (arc4random() % 100)/100.0;
    float blue = (arc4random() % 100)/100.0;
    float green = (arc4random() % 100)/100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
}

- (void)rgbSwitcherIndex:(int)i{
    switch (i) {
        case 0:
            self.circleColor = [UIColor redColor];
            break;
        case 1:
            self.circleColor = [UIColor blueColor];
            break;
        case 2:
            self.circleColor = [UIColor greenColor];
            break;
        default:
            break;
    }
}

@end
