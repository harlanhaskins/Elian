//
//  UIButtonWithToggle.m
//  Elian
//
//  Created by Harlan Haskins on 8/6/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import "UIButtonWithToggle.h"

@implementation UIButtonWithToggle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.alpha = 0.5;
        self.tag = 0;
    }
    return self;
}

-(void) toggleState {
    if (self.tag == 0) {
        self.alpha = 1;
        self.tag = 1;
    }
    else {
        self.alpha = 0.5;
        self.tag = 0;
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self toggleState];
}

@end
