//
//  LetterComposerViewController.m
//  Elian
//
//  Created by Harlan Haskins on 8/11/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import "LetterComposerViewController.h"

@interface LetterComposerViewController ()

@end

@implementation LetterComposerViewController {
    UIView* buttonView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self resetButtonPressed];
    
    navTitle = @"Try Making a Letter";
    
    [self positionButtons];
    
    [self positionControlButtons];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      @"ElianLetters" ofType:@"plist"];
    
    _letterCodes = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    _textField = [[UITextField alloc] init];
    _textField.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    _textField.height = 44.0;
    _textField.placeholder = @"Your letters will show up here";
    _textField.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_textField];
    
    [self.navigationItem setTitle:navTitle];
}

- (void) viewDidLayoutSubviews {
    _textField.width = self.view.width * 0.75;
    _textField.centerX = self.view.width / 2;
    _textField.y = buttonView.y / 2 + 10;
}

- (void) positionControlButtons {
    
    CGFloat padding = 10.0;
    
    CGRect buttonFrame = CGRectZero;
    buttonFrame.size = CGSizeMake(80, 40);
    buttonFrame.origin.x = padding * 3;
    buttonFrame.origin.y = self.view.height - 110;
    
    _shiftButton = [[UIButtonWithToggle alloc] init];
    [_shiftButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_shiftButton setTitle:@"shift" forState:UIControlStateNormal];
    [_shiftButton setTitleColor:[UIColor colorWithRed:0.115 green:0.508 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
    _shiftButton.frame = buttonFrame;
    
    [self.view addSubview:_shiftButton];
    
    buttonFrame.origin.x += buttonFrame.size.width + padding;
    
    _deleteButton = [[CustomUIButton alloc] init];
    [_deleteButton addTarget:self action:@selector(deleteButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [_deleteButton setTitle:@"delete" forState:UIControlStateNormal];
    [_deleteButton setTitleColor:[UIColor colorWithRed:0.115 green:0.508 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
    
    _deleteButton.frame = buttonFrame;
    
    [self.view addSubview:_deleteButton];
    
    buttonFrame.origin.x += buttonFrame.size.width + padding;
    
    _enterButton = [[CustomUIButton alloc] init];
    [_enterButton addTarget:self action:@selector(enterButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [_enterButton setTitle:@"enter" forState:UIControlStateNormal];
    [_enterButton setTitleColor:[UIColor colorWithRed:0.115 green:0.508 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
    
    _enterButton.frame = buttonFrame;
    
    [self.view addSubview:_enterButton];
    
    buttonFrame.origin.x = _shiftButton.x;
    buttonFrame.origin.y += _shiftButton.height + padding;
    
    _resetButton = [[CustomUIButton alloc] init];
    [_resetButton addTarget:self action:@selector(resetButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [_resetButton setTitle:@"reset" forState:UIControlStateNormal];
    [_resetButton setTitleColor:[UIColor colorWithRed:0.115 green:0.508 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
    
    _resetButton.frame = buttonFrame;
    
    [self.view addSubview:_resetButton];
    
    buttonFrame.origin.x += buttonFrame.size.width + padding;
    
    _spaceButton = [[CustomUIButton alloc] init];
    [_spaceButton addTarget:self action:@selector(spaceButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [_spaceButton setTitle:@"space" forState:UIControlStateNormal];
    [_spaceButton setTitleColor:[UIColor colorWithRed:0.115 green:0.508 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
    
    _spaceButton.frame = buttonFrame;
    
    [self.view addSubview:_spaceButton];
    
    buttonFrame.origin.x += buttonFrame.size.width + padding;
    
    _clearButton = [[CustomUIButton alloc] init];
    [_clearButton addTarget:self action:@selector(clearButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [_clearButton setTitle:@"clear" forState:UIControlStateNormal];
    [_clearButton setTitleColor:[UIColor colorWithRed:0.115 green:0.508 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
    
    _clearButton.frame = buttonFrame;
    
    [self.view addSubview:_clearButton];
}

- (void) positionButtons {
    _buttons = [NSMutableArray array];
    
    buttonView = [UIView new];
    
    CGSize buttonSideSize = CGSizeMake(25, 120);
    CGSize buttonSize = CGSizeMake(120, 25);
    
    for (int i = 0; i < 8; i++) {
        UIButtonWithToggle *button = [[UIButtonWithToggle alloc] init];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        button.backgroundColor = [UIColor blackColor];
        if (i == 0 ||
            i == 3 ||
            i == 6) {
            [button setSize:buttonSize];
            button.x = buttonSideSize.width;
            button.y = (i / 3) * (buttonSideSize.height - (buttonSize.height / 2));
        }
        else if (i == 1 ||
                 i == 2 ||
                 i == 4 ||
                 i == 5) {
            [button setSize:buttonSideSize];
            button.y = 0;
            button.x = 0;
            switch (i) {
                case 2: {
                    button.x += buttonSideSize.width + buttonSize.width;
                    break;
                }
                case 4: {
                    button.y += buttonSize.width;
                    break;
                }
                case 5: {
                    button.y += buttonSize.width;
                    button.x += buttonSideSize.width + buttonSize.width;
                    break;
                }
            }
        }
        else if (i == 7) {
            button.size = CGSizeMake(30, 30);
            button.x = (buttonSideSize.width + (buttonSize.width / 2)) - (button.size.width / 2);
            button.y = (([(UIButton*)_buttons[3] y] - [_buttons[0] bottom]) / 2) + (button.size.height / 3.5);
        }
        [buttonView addSubview:button];
        [_buttons addObject:button];
    }
    buttonView.width = [_buttons[0] width] + ([_buttons[0] height] * 2);
    buttonView.height = [_buttons[0] width] * 2;
    [self.view addSubview:buttonView];
    [buttonView centerToParent];
}

- (void) buttonPressed:(UIButtonWithToggle*)button {
    
    NSString *currentLetterCode = @"";
    for (UIButtonWithToggle *button in _buttons) {
        currentLetterCode = [NSString stringWithFormat:@"%@%u", currentLetterCode, button.on];
    }
    
    if (self.isShifted && ![self.navigationItem.title isEqualToString:navTitle])
        [self.navigationItem setTitle:[[self letterForButtonToggle:currentLetterCode] uppercaseString]];
    else
        [self.navigationItem setTitle:[self letterForButtonToggle:currentLetterCode]];
}

-(void)backgroundTouched:(id)sender
{
    [self.textField resignFirstResponder];
}

-(void) enterButtonPressed {
    if (![self.navigationItem.title isEqualToString:navTitle]) {
        self.textField.text = [self.textField.text stringByAppendingString:self.navigationItem.title];
    }
    [self resetButtonPressed];
    self.navigationItem.title = navTitle;
}

-(void) spaceButtonPressed {
    self.textField.text = [self.textField.text stringByAppendingString:@" "];
}

- (BOOL) isShifted {
    return _shiftButton.on;
}

- (void) clearButtonPressed {
    _textField.text = @"";
    [self resetButtonPressed];
}

- (void) resetButtonPressed {
    self.shiftButton.on = NO;
    self.shiftButton.alpha = 0.5f;
    self.navigationItem.title = navTitle;
    for (UIButtonWithToggle *button in _buttons) {
        if (button.on) {
            [button toggleState];
        }
    }
}

- (void) deleteButtonPressed {
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

-(NSString*)letterForButtonToggle:(NSString*) letterCode {
    NSString *text = self.letterCodes[letterCode];
    if (!text) {
        text = navTitle;
    }
    return text;
}

@end
