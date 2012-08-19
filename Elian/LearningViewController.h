//
//  LearningViewController.h
//  Elian
//
//  Created by Harlan Haskins on 8/18/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import "UIViewControllerWithBackgroundImage.h"
#import "UIButtonWithToggle.h"

@interface LearningViewController : UIViewControllerWithBackgroundImage
@property (weak, nonatomic) IBOutlet UIButtonWithToggle *shortButton;
@property (weak, nonatomic) IBOutlet UIButtonWithToggle *mediumButton;
@property (weak, nonatomic) IBOutlet UIButtonWithToggle *longButton;

@end
