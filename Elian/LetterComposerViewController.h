//
//  LetterComposerViewController.h
//  Elian
//
//  Created by Harlan Haskins on 8/11/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUIButton.h"
#import "UIButtonWithToggle.h"

@interface LetterComposerViewController : UIViewController {
    NSString* navTitle;
}

@property (nonatomic) UIButtonWithToggle *shiftButton;
@property (nonatomic) CustomUIButton *deleteButton;
@property (nonatomic) CustomUIButton *clearButton;
@property (nonatomic) CustomUIButton *resetButton;
@property (nonatomic) CustomUIButton *spaceButton;
@property (nonatomic) CustomUIButton *enterButton;

@property (nonatomic) UITextField* textField;
@property (nonatomic) BOOL isShifted;
@property (nonatomic) NSMutableArray *buttons;
@property (nonatomic) NSDictionary* letterCodes;

-(void) buttonPressed:(UIButtonWithToggle*)button;
-(void) spaceButtonPressed;
-(void) enterButtonPressed;
-(void) clearButtonPressed;
-(void) resetButtonPressed;
-(void) deleteButtonPressed;

-(void) backgroundTouched:(id)sender;

-(NSString*) letterForButtonToggle:(NSString*)currentLetterCode;

@end
