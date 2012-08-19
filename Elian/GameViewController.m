//
//  GameViewController.m
//  Elian
//
//  Created by Harlan Haskins on 8/18/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import "GameViewController.h"
#import "CustomUIButton.h"

@interface GameViewController ()

@end

@implementation GameViewController

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
    if (_isElianToEnglish) {
        _letterLabel.font = [UIFont fontWithName:@"Elian Variant" size:140];
    }
    else {
        _choice1Label.font = [UIFont fontWithName:@"Elian Variant" size:28];
        _choice2Label.font = [UIFont fontWithName:@"Elian Variant" size:28];
        _choice3Label.font = [UIFont fontWithName:@"Elian Variant" size:28];
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [_timer fire];
    _alphabet = [self shuffledAlphabet:@"abcdefghijklmnopqrstuvwxyz"];
    [self setUpGame];
}

-(void)updateTime {
    _timeInSeconds++;
    int hours = _timeInSeconds / 3600;
    int minutes = _timeInSeconds / 60 -hours * 60;
    int seconds = _timeInSeconds - hours* 3600 - minutes * 60;
    _timeLabel.text = [NSString stringWithFormat:@"Time: %02d:%02d:%02d", hours, minutes, seconds];
}

- (IBAction)choiceMade:(id)sender {
    CustomUIButton* b = (CustomUIButton*)sender;
    if (b.tag == _correctChoice) {
        _correctAnswers++;
        _correctAnswerLabel.text = [NSString stringWithFormat:@"Correct Answers: %i", _correctAnswers];
    }
    else {
        _incorrectAnswers++;
        _incorrectAnswerLabel.text = [NSString stringWithFormat:@"Incorrect Answers: %i", _incorrectAnswers];
    }
    _playedGames++;
    [self setUpGame];
}

-(NSString*) shuffledAlphabet:(NSString*)finalLettersString {
    NSUInteger length = [finalLettersString length];
    
    if (!length) return nil; // nothing to shuffle
    
    unichar *buffer = calloc(length, sizeof (unichar));
    
    [finalLettersString getCharacters:buffer range:NSMakeRange(0, length)];
    
    for(int i = length - 1; i >= 0; i--){
        int j = arc4random() % (i + 1);
        //NSLog(@"%d %d", i, j);
        //swap at positions i and j
        unichar c = buffer[i];
        buffer[i] = buffer[j];
        buffer[j] = c;
    }
    
    NSString *result = [NSString stringWithCharacters:buffer length:length];
    free(buffer);
    
    return result;
}

-(void) setUpGame {
    if (_playedGames < _gameLength) {
        NSString* question = [NSString stringWithFormat:@"%c", [_alphabet characterAtIndex:_playedGames]];
        _letterLabel.text = question;
        NSString* alphabetWithoutCorrectChoice = [NSString stringWithFormat:@"%@%@", [_alphabet substringToIndex:_playedGames], [_alphabet substringFromIndex:(_playedGames + 1)]];
        int incorrectChoiceIndex = arc4random_uniform(25);
        NSString* incorrectChoice1 = [NSString stringWithFormat:@"%c", [alphabetWithoutCorrectChoice characterAtIndex:incorrectChoiceIndex]];
        alphabetWithoutCorrectChoice = [NSString stringWithFormat:@"%@%@", [alphabetWithoutCorrectChoice substringToIndex:incorrectChoiceIndex], [_alphabet substringFromIndex:(incorrectChoiceIndex + 1)]];
        incorrectChoiceIndex = arc4random_uniform(25);
        NSString* incorrectChoice2 = [NSString stringWithFormat:@"%c", [alphabetWithoutCorrectChoice characterAtIndex:incorrectChoiceIndex]];
        _correctChoice = arc4random_uniform(3);
        if (_correctChoice == 0) {
            _choice1Label.text = _letterLabel.text;
            _choice2Label.text = incorrectChoice1;
            _choice3Label.text = incorrectChoice2;
        }
        else if (_correctChoice == 1) {
            _choice2Label.text = _letterLabel.text;
            _choice3Label.text = incorrectChoice1;
            _choice1Label.text = incorrectChoice2;
        }
        else {
            _choice3Label.text = _letterLabel.text;
            _choice1Label.text = incorrectChoice1;
            _choice2Label.text = incorrectChoice2;
        }
    }
    else {
        [_timer invalidate];
        [self performSegueWithIdentifier:@"Results" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLetterLabel:nil];
    [self setChoice1Label:nil];
    [self setChoice2Label:nil];
    [self setChoice3Label:nil];
    [self setCorrectAnswerLabel:nil];
    [self setIncorrectAnswerLabel:nil];
    [self setTimeLabel:nil];
    [self setBestTimeLabel:nil];
    [super viewDidUnload];
}
@end
