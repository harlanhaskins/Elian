//
//  ResultsViewController.m
//  Elian
//
//  Created by Harlan Haskins on 8/19/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import "ResultsViewController.h"
#import "AppDelegate.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

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
    _correctAnswerLabel.text = [NSString stringWithFormat:@"Correct Answers: %@", _currentGame.correctAnswers];
    _incorrectAnswerLabel.text = [NSString stringWithFormat:@"Incorrect Answers: %d", [_currentGame.gameSize intValue] - [_currentGame.correctAnswers intValue]];
	_timeLabel.text = [NSString stringWithFormat:@"Time: %@", _currentGame.time];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doDismiss:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
