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

- (void)viewDidLoad
{
    [super viewDidLoad];
    _correctAnswerLabel.text = [NSString stringWithFormat:@"Correct Answers: %d", _currentGame.correctAnswers];
    _incorrectAnswerLabel.text = [NSString stringWithFormat:@"Incorrect Answers: %d", _currentGame.gameSize - _currentGame.correctAnswers];
	_timeLabel.text = [NSString stringWithFormat:@"Time: %d", _currentGame.time];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doDismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
