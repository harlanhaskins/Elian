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
        self.on = NO;
    }
    return self;
}

-(void) toggleState {
    if (self.on == NO) {
        self.alpha = 1;
        self.on = YES;
    }
    else {
        self.alpha = 0.5;
        self.on = NO;
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self toggleState];
}

@end
