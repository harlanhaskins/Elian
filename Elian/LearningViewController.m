//
//  LearningViewController.m
//  Elian
//
//  Created by Harlan Haskins on 8/18/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import "LearningViewController.h"
#import "GameViewController.h"
#import "Game.h"

@interface LearningViewController ()

@end

@implementation LearningViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setDifficulty:(id)sender {
    UIButtonWithToggle* b = (UIButtonWithToggle*) sender;
    b.tag = 1;
    b.alpha = 1;
    if ([b.titleLabel.text isEqualToString:@"s"]) {
        self.mediumButton.tag = 0;
        self.mediumButton.alpha = 0.5;
        self.longButton.tag = 0;
        self.longButton.alpha = 0.5;
    }
    if ([b.titleLabel.text isEqualToString:@"m"]) {
        self.shortButton.tag = 0;
        self.shortButton.alpha = 0.5;
        self.longButton.tag = 0;
        self.longButton.alpha = 0.5;
    }
    if ([b.titleLabel.text isEqualToString:@"l"]) {
        self.mediumButton.tag = 0;
        self.mediumButton.alpha = 0.5;
        self.shortButton.tag = 0;
        self.shortButton.alpha = 0.5;
    }
}

@end
