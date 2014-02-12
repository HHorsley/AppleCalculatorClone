//
//  TAACalculator.m
//  AppleCalculatorClone
//
//  Hunter Horsley, 2/12/2014
//

#import "TAACalculator.h"

@interface TAACalculator()
{
    BOOL equalsPressed;
    BOOL operatorPressed;
    BOOL decimalPressed;
    BOOL throwError;
    int decimalCounter;
    NSString *savedOperator;

    
}

//private properties go here

@property(nonatomic, strong) NSNumber *num1;
@property(nonatomic, strong) NSNumber *num2;


//private method signatures go here



@end

@implementation TAACalculator


-(void)setOperator:(NSString *)operator
{
    throwError = false;
    operatorPressed = !operatorPressed;
    equalsPressed = false;
    
    if (_num2 == nil) {
        savedOperator = operator;
        decimalPressed = false;
        decimalCounter = 0;
    } else {
           if([operator isEqualToString:@"="])
           {
               equalsPressed = true;
               decimalPressed = false;
               decimalCounter = 0;
               operator = savedOperator;
           }
            if([savedOperator isEqualToString:@"X"])
            {
                _num1 = [NSNumber numberWithDouble: ([_num1 doubleValue] * [_num2 doubleValue])];
                if (equalsPressed == false) {
                    _num2 = nil;
                }
                decimalPressed = false;
                decimalCounter = 0;
                savedOperator = operator;
                [self displayResult];
            }
               if([savedOperator isEqualToString:@"/"])
            {
                if( [_num2 integerValue] == 0) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"What the hell man!?"
                                                                    message:@"You can't divide by zero. Come on. Act like an adult."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK, I'm Sorry"
                                                          otherButtonTitles:nil];
                    [alert show];
                    _num2 = nil;
                    _num1 = nil;
                    decimalPressed = false;
                    decimalCounter = 0;
                    savedOperator = operator;
                    throwError = true;
                    [self displayResult];
                    return;
                    
                }
                _num1 = [NSNumber numberWithDouble: ([_num1 doubleValue] / [_num2 doubleValue])];
                if (equalsPressed == false) {
                    _num2 = nil;
                }
                decimalPressed = false;
                decimalCounter = 0;
                savedOperator = operator;
                [self displayResult];
            }
               if([savedOperator isEqualToString:@"+"])
            {
                _num1 = [NSNumber numberWithDouble: ([_num1 doubleValue] + [_num2 doubleValue])];
                if (equalsPressed == false) {
                    _num2 = nil;
                }
                decimalPressed = false;
                decimalCounter = 0;
                savedOperator = operator;
                [self displayResult];
            } else if([savedOperator isEqualToString:@"-"])
            {
                _num1 = [NSNumber numberWithDouble: ([_num1 doubleValue] - [_num2 doubleValue])];
                if (equalsPressed == false) {
                    _num2 = nil;
                }
                decimalPressed = false;
                decimalCounter = 0;
                savedOperator = operator;
                [self displayResult];
            }
        }
    }

-(void)setTopKey:(NSString *)TopKey
{
    throwError = false;
    if([TopKey isEqualToString:@"."])
    {
        decimalPressed = true;
        if (decimalCounter <= 1){
            decimalCounter = 1;
        }
    }
    if([TopKey isEqualToString:@"C"])
    {
        _num1 = nil;
        _num2 = nil;
        decimalCounter = 0;
        decimalPressed = false;
    }
    if([TopKey isEqualToString:@"+/-"])
    {
        if (_num1 != nil)
        {
            if (_num2 != nil)
            {
                _num2 = [NSNumber numberWithDouble: ([_num2 doubleValue] * (-1))];
            } else {
                _num1 = [NSNumber numberWithDouble: ([_num1 doubleValue] * (-1))];
            }
        }
    }
    if([TopKey isEqualToString:@"%"])
    {
        if (_num1 != nil)
            {
                if (_num2 != nil)
                {
                    _num2 = [NSNumber numberWithDouble: ([_num2 doubleValue] * 0.01)];
                } else {
                    _num1 = [NSNumber numberWithDouble: ([_num1 doubleValue] * 0.01)];
                }
            }
    }
    [self displayResult];
}

-(void)setNumber:(NSNumber *)Num
{
    throwError = false;
    if (_num1 == nil) {
        if (decimalPressed) {
            _num1 = @(0.0);
        } else {
            _num1 = Num;
        }
    } else if (equalsPressed)
            {
                _num1 = Num;
                _num2 = nil;
                decimalPressed = false;
                decimalCounter = 0;
                operatorPressed = false;
                
            } else if(operatorPressed) {
                if (_num2 == nil || equalsPressed) {
                    if (decimalPressed) {
                        _num2 = @(0.0);
                    } else {
                        _num2 = Num;
                    }
                } else {
                    if (decimalPressed) {
                        _num2 = [NSNumber numberWithDouble: ([_num2 doubleValue] + [Num doubleValue] * pow(10, -decimalCounter))];
                        decimalCounter++;
                    } else {
                        _num2 = [NSNumber numberWithDouble: ([_num2 doubleValue]*10 + [Num doubleValue])];
                    }
                }
            } else {
                if (decimalPressed) {
                    _num1 = [NSNumber numberWithDouble: ([_num1 doubleValue] + [Num doubleValue] * pow(10, -decimalCounter))];
                    decimalCounter++;
                } else {
                    _num1 = [NSNumber numberWithDouble: ([_num1 doubleValue]*10 + [Num doubleValue])];
                }
            }
    [self displayResult];
}

-(NSNumber *)displayResult
{
    NSLog(@"Num1 %@", _num1);
    NSLog(@"Num2 %@", _num2);
    if (throwError){
        return nil;
    }
    if (_num1 == nil)
    {
        return @(0);
    } else {
        if (_num2 != nil && equalsPressed == false)
        {
            return _num2;
        } else {
            return _num1;
        }
    }
}


//your implementation of  your public methods go here


@end
