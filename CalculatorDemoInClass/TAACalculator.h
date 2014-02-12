//
//  TAACalculator.h
//  AppleCalculatorClone
//
//  Hunter Horsley, 2/12/2014
//

#import <Foundation/Foundation.h>

@interface TAACalculator : NSObject
{
    //your instance variables go here
    
}

//your properties go here

//take in input from keypad
-(void)setNumber:(NSNumber *)Num;
-(void)setOperator:(NSString *)Operator;
-(void)setTopKey:(NSString *)TopKey;


//display result of operation
-(NSNumber *)displayResult;


//your public method signatures go here





@end
