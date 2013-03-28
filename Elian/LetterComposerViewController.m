//
//  LetterComposerViewController.m
//  Elian
//
//  Created by Harlan Haskins on 8/11/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import "LetterComposerViewController.h"
#import "UIButtonWithToggle.h"

@interface LetterComposerViewController ()

@end

@implementation LetterComposerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self resetButtonPressed];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.png"]];
    navTitle = @"Try Making a Letter";
    self.buttons = [NSArray arrayWithObjects:self.topButton, self.topLeftButton, self.topRightButton, self.middleButton, self.bottomLeftButton, self.bottomRightButton, self.bottomButton, self.dotButton, nil];
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      @"ElianLetters" ofType:@"plist"];
    self.letterCodes = [[NSDictionary alloc] initWithContentsOfFile:path];
    [self.navigationItem setTitle:navTitle];
}

- (IBAction)buttonPressed {
    NSString *currentLetterCode = @"";
    for (UIButtonWithToggle* button in self.buttons) {
        currentLetterCode = [currentLetterCode stringByAppendingFormat:@"%u", button.tag];
    }
    
    if (self.isShifted && ![self.navigationItem.title isEqualToString:navTitle])
        [self.navigationItem setTitle:[[self letterForButtonToggle:currentLetterCode] uppercaseString]];
    else
        [self.navigationItem setTitle:[self letterForButtonToggle:currentLetterCode]];
}

-(IBAction)backgroundTouched:(id)sender
{
    [self.textField resignFirstResponder];
}

-(IBAction) enterButtonPressed {
    if (![self.navigationItem.title isEqualToString:navTitle]) {
        NSString *temp = self.textField.text;
        self.textField.text = [NSString stringWithFormat:@"%@%@", temp, self.navigationItem.title];
    }
    [self resetButtonPressed];
    self.navigationItem.title = navTitle;
}

-(IBAction) spaceButtonPressed {
    self.textField.text = [self.textField.text stringByAppendingString:@" "];
}

- (IBAction)shiftButtonPressed:(id)sender {
    UIButtonWithToggle* b = (UIButtonWithToggle*)sender;
    if (b.tag == 0)
        self.isShifted = NO;
    else
        self.isShifted = YES;
    [self buttonPressed];
}

-(IBAction) clearButtonPressed {
    self.textField.text = @"";
}

- (IBAction)resetButtonPressed {
    for (UIButtonWithToggle* button in self.buttons) {
        button.tag = 0;
        button.alpha = 0.5f;
    }
    self.shiftButton.tag = 0;
    self.shiftButton.alpha = 0.5f;
    self.isShifted = NO;
    self.navigationItem.title = navTitle;
}

-(IBAction) deleteButtonPressed {
    if ([self.textField.text length] > 1) {
        self.textField.text = [self.textField.text substringToIndex:([self.textField.text length] - 2)];
    }
    else {
        [self clearButtonPressed];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSString*)letterForButtonToggle:(NSString*) currentLetterCode {
    NSString* codeLetter = navTitle;
    NSLog(@"%@", currentLetterCode);
    for (id code in self.letterCodes) {
        NSDictionary* codeKey = [self.letterCodes objectForKey:code];
        for (int i = 0; i < [codeKey count]; i++) {
            NSString* letterCode = [codeKey objectForKey:[NSString stringWithFormat:@"%i", i]];
            if (letterCode != nil && [currentLetterCode isEqualToString:letterCode]) {
                codeLetter = code;
            }
        }
    }
    return codeLetter;
}
@end
