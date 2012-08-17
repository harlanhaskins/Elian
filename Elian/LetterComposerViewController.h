//
//  LetterComposerViewController.h
//  Elian
//
//  Created by Harlan Haskins on 8/11/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UIButtonWithToggle;
@class CustomUIButton;

@interface LetterComposerViewController : UIViewController {
    NSString* navTitle;
}

@property IBOutlet UIButtonWithToggle* topButton;
@property IBOutlet UIButtonWithToggle* topLeftButton;
@property IBOutlet UIButtonWithToggle* topRightButton;
@property IBOutlet UIButtonWithToggle* middleButton;
@property IBOutlet UIButtonWithToggle* bottomLeftButton;
@property IBOutlet UIButtonWithToggle* bottomRightButton;
@property IBOutlet UIButtonWithToggle* bottomButton;
@property IBOutlet UIButtonWithToggle* dotButton;
@property IBOutlet UIButtonWithToggle *shiftButton;
@property IBOutlet UITextField* textField;
@property BOOL isShifted;
@property (strong, nonatomic) NSArray *buttons;
@property (nonatomic, retain) NSDictionary* letterCodes;
@end