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

@synthesize letterCodes = _letterCodes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    navTitle = @"Nothing.";
    _buttons = [NSArray arrayWithObjects:_topButton, _topLeftButton, _topRightButton, _middleButton, _bottomLeftButton, _bottomRightButton, _bottomButton, _dotButton, nil];
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      @"ElianLetters" ofType:@"plist"];
    _letterCodes = [[NSDictionary alloc] initWithContentsOfFile:path];
    [self.navigationItem setTitle:navTitle];
}

- (IBAction)buttonPressed {
    NSMutableArray* tags = [[NSMutableArray alloc] init];
    for (UIButtonWithToggle* button in _buttons) {
        [tags addObject:[NSString stringWithFormat:@"%u", button.tag]];
    }
    NSString* currentLetterCode = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@", [tags objectAtIndex:0], [tags objectAtIndex:1], [tags objectAtIndex:2], [tags objectAtIndex:3], [tags objectAtIndex:4], [tags objectAtIndex:5], [tags objectAtIndex:6], [tags objectAtIndex:7]];
    
    if (_isShifted && ![self.navigationItem.title isEqualToString:navTitle])
        [self.navigationItem setTitle:[[self letterForButtonToggle:currentLetterCode] uppercaseString]];
    else
        [self.navigationItem setTitle:[self letterForButtonToggle:currentLetterCode]];
}

-(IBAction)backgroundTouched:(id)sender
{
    [_textField resignFirstResponder];
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
    NSString *temp = [NSString stringWithFormat:@"%@ ", self.textField.text];
    self.textField.text = nil;
    self.textField.text = temp;
}

- (IBAction)shiftButtonPressed:(id)sender {
    UIButtonWithToggle* b = (UIButtonWithToggle*)sender;
    if (b.tag == 0)
        _isShifted = NO;
    else
        _isShifted = YES;
    [self buttonPressed];
}


-(IBAction) clearButtonPressed {
    self.textField.text = @"";
}
- (IBAction)resetButtonPressed {
    for (UIButtonWithToggle* button in _buttons) {
        button.tag = 0;
        button.alpha = 0.5f;
    }
    _shiftButton.tag = 0;
    _shiftButton.alpha = 0.5f;
    _isShifted = NO;
    self.navigationItem.title = navTitle;
}

-(IBAction) deleteButtonPressed {
    if ([self.textField.text length] > 1) {
        NSString *temp = [self.textField.text substringToIndex:([self.textField.text length] - 2)];
        self.textField.text = temp;
    }
    else {
        [self clearButtonPressed];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    _buttons = nil;
    _letterCodes = nil;
}

-(NSString*)letterForButtonToggle:(NSString*) currentLetterCode {
    NSString* codeLetter = navTitle;
    for (id code in _letterCodes) {
        NSDictionary* codeKey = [_letterCodes objectForKey:code];
        for (int i = 0; i < 4; i++) {
            NSString* letterCode = [codeKey objectForKey:[NSString stringWithFormat:@"%i", i]];
            if (letterCode != nil && [currentLetterCode isEqualToString:letterCode]) {
                codeLetter = code;
            }
        }
    }
    return codeLetter;
}
@end
