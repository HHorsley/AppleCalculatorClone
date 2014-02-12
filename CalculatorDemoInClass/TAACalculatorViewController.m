//
//  TAACalculatorViewController.m
//  AppleCalculatorClone
//
//  Hunter Horsley, 2/12/2014
//

#import "TAACalculatorViewController.h"
#import "TAACalculator.h"

@interface TAACalculatorViewController ()
{
    //our display
    IBOutlet UILabel *outputDisplay;
    
    //operations
    IBOutletCollection(UIButton) NSArray *operations;
    
    //top row
    IBOutletCollection(UIButton) NSArray *topRow;
    
    //numbers
    IBOutletCollection(UIButton) NSArray *numbersAndDecimal;
}

@property(nonatomic, strong) TAACalculator *calc;

//helper method to style the buttons
- (void)addButtonBordersToCalculatorButtons:(NSArray *)buttons;

//button handlers for each of the calculator buttons
- (IBAction)numberPressed:(id)sender;
- (IBAction)operationPressed:(id)sender;
- (IBAction)topRowPressed:(id)sender;
@end

@implementation TAACalculatorViewController

- (void)viewDidLoad
{
    _calc = [[TAACalculator alloc] init];
    outputDisplay.adjustsFontSizeToFitWidth = YES;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    for (UIButton *numberButton in numbersAndDecimal) {
        [numberButton addTarget:self
                         action:@selector(numberPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    }
    
    for (UIButton *operationButton in operations) {
        [operationButton addTarget:self
                            action:@selector(operationPressed:)
                  forControlEvents:UIControlEventTouchUpInside];
    }
    
    for (UIButton *topRowButton in topRow) {
        [topRowButton addTarget:self
                         action:@selector(topRowPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    }
    //display getResult
        
    
    [self addButtonBordersToCalculatorButtons:operations];
    [self addButtonBordersToCalculatorButtons:topRow];
    [self addButtonBordersToCalculatorButtons:numbersAndDecimal];
}

#pragma mark - View Setup

- (void)addButtonBordersToCalculatorButtons:(NSArray *)buttons
{
    for (UIButton *button in buttons) {
        [[button layer] setBorderWidth:0.25f];
        [[button layer] setBorderColor:[UIColor blackColor].CGColor];
    }
}

#pragma mark - IBActions

- (IBAction)numberPressed:(id)sender
{
    UIButton *buttonPressed = (UIButton *)sender;
    NSLog(@"%@", buttonPressed.titleLabel.text);
    //store the number clicked
    NSNumber *num = [NSNumber numberWithInt: [buttonPressed.titleLabel.text intValue]];
    //num = num //ns string concatenate
    //pass the number clicked into calc class
    [_calc setNumber:num];
    [outputDisplay setText:[[_calc displayResult] stringValue]];
}

- (IBAction)operationPressed:(id)sender
{
    UIButton *buttonPressed = (UIButton *)sender;
    NSLog(@"%@", buttonPressed.titleLabel.text);
    
    NSString *operator = buttonPressed.titleLabel.text;
    [_calc setOperator:operator];
    if ([_calc displayResult] == nil)
        {
            [outputDisplay setText:@"Error"];
        } else {
            [outputDisplay setText:[[_calc displayResult] stringValue]];
        }
}

- (IBAction)topRowPressed:(id)sender
{
    UIButton *buttonPressed = (UIButton *)sender;
    NSLog(@"%@", buttonPressed.titleLabel.text);
    
    NSString *topKey = buttonPressed.titleLabel.text;
    [_calc setTopKey:topKey];
    [outputDisplay setText:[[_calc displayResult] stringValue]];
}

@end
