//
//  GameViewController.m
//  Elian
//
//  Created by Harlan Haskins on 8/18/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import "GameViewController.h"
#import "CustomUIButton.h"
#import "ResultsViewController.h"
#import "Game.h"

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

-(id) initWithGame:(Game*)game {
    self = [super init];
    if(self) {
        _currentGame = game;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_currentGame.isElianToEnglish) {
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
    [self setUpRound];
}

-(void)updateTime {
    _currentGame.time = @([_currentGame.time intValue] + 1);
    int hours = [_currentGame.time intValue] / 3600;
    int minutes = [_currentGame.time intValue] / 60 - hours * 60;
    int seconds = [_currentGame.time intValue] - hours* 3600 - minutes * 60;
    _timeLabel.text = [NSString stringWithFormat:@"Time: %02d:%02d:%02d", hours, minutes, seconds];
}

- (IBAction)choiceMade:(id)sender {
    CustomUIButton* b = (CustomUIButton*)sender;
    if (b.tag == _correctChoice) {
        _currentGame.correctAnswers = @([_currentGame.correctAnswers intValue] + 1);
        _correctAnswerLabel.text = [NSString stringWithFormat:@"Correct Answers: %@", _currentGame.correctAnswers];
    }
    else {
        _incorrectAnswers++;
        _incorrectAnswerLabel.text = [NSString stringWithFormat:@"Incorrect Answers: %i", _incorrectAnswers];
    }
    _playedRounds++;
    [self setUpRound];
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

-(void) setUpRound {
    if (_playedRounds < [_currentGame.gameSize intValue]) {
        //Display the first letter in the shuffled alphabet
        NSString* questionString = [NSString stringWithFormat:@"%c", [_alphabet characterAtIndex:0]];
        _letterLabel.text = questionString;
        
        //Now remove that letter from the global alphabet so we can continue the game with new letters.
        NSString* tempAlphabet = [NSString stringWithFormat:@"%@", [_alphabet substringFromIndex:1]];
        _alphabet = tempAlphabet;
        
        //Create two incorrect choices by generating a random number less than the size of the alphabet as it currently stands.
        int numberOfCharactersFromWhichToChoose = [_alphabet length] - 2;
        int incorrectChoiceIndex = arc4random_uniform(numberOfCharactersFromWhichToChoose);
        NSString* alphabetWithoutCorrectChoice = [NSString stringWithFormat:@"%@%@", [_alphabet substringToIndex:incorrectChoiceIndex], [_alphabet substringFromIndex:(incorrectChoiceIndex + 1)]];
        NSString* incorrectChoice1 = [NSString stringWithFormat:@"%c", [alphabetWithoutCorrectChoice characterAtIndex:incorrectChoiceIndex]];
        int incorrectChoiceIndex2 = arc4random_uniform(numberOfCharactersFromWhichToChoose);
        while (incorrectChoiceIndex2 == incorrectChoiceIndex) {
            incorrectChoiceIndex2 = arc4random_uniform(numberOfCharactersFromWhichToChoose);
        }
        alphabetWithoutCorrectChoice = [NSString stringWithFormat:@"%@%@", [alphabetWithoutCorrectChoice substringToIndex:incorrectChoiceIndex2], [alphabetWithoutCorrectChoice substringFromIndex:(incorrectChoiceIndex2 + 1)]];
        NSString* incorrectChoice2 = [NSString stringWithFormat:@"%c", [alphabetWithoutCorrectChoice characterAtIndex:incorrectChoiceIndex2]];
        
        //Now that the incorrect choices are set, pick which button is going to display the correct answer by generating another random number.
        _correctChoice = arc4random_uniform(3);
        if (_correctChoice == 0) {
            _choice1Label.text = _letterLabel.text;
            _choice2Label.text = incorrectChoice1;
            _choice3Label.text = incorrectChoice2;
        }
        else if (_correctChoice == 1) {
            _choice1Label.text = incorrectChoice1;
            _choice2Label.text = _letterLabel.text;
            _choice3Label.text = incorrectChoice2;
        }
        else {
            _choice1Label.text = incorrectChoice1;
            _choice2Label.text = incorrectChoice2;
            _choice3Label.text = _letterLabel.text;
        }
    }
    else {
        [_timer invalidate];
        [self performSegueWithIdentifier:@"presentResults" sender:self];
        [self performSelector:@selector(moveToFirstVC) withObject:self afterDelay:1.0];
    }
}

-(void) moveToFirstVC {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"presentResults"]) {
        ResultsViewController *rvc = (ResultsViewController*)[segue destinationViewController];
        rvc.currentGame = _currentGame;
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
