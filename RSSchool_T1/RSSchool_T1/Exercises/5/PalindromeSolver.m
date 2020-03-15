#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    int countOfChangedDigits = [k intValue];
    int countOfDigits = [n intValue];
    NSString* maxElement = @"9";
    
    NSMutableString *resultStr = [NSMutableString new];
    NSMutableString *firstHalfString = [[NSMutableString alloc] initWithString:[s substringToIndex:(countOfDigits / 2)]];
    
    NSRange rangeOfSecondHalfString = NSMakeRange(countOfDigits / 2, countOfDigits / 2);
    NSMutableString *secondHalfString = [[NSMutableString alloc] initWithString:[s substringWithRange:rangeOfSecondHalfString]];
    NSMutableString *reversedSecondHalfString = [NSMutableString new];
    
    NSInteger charIndex = [secondHalfString length];
    while (charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedSecondHalfString appendString:[secondHalfString substringWithRange:subStrRange]];
    }
    
    for (NSInteger i = 0; i < [firstHalfString length]; i++) {
        if (countOfDigits > 0) {
            NSRange charRange = NSMakeRange(i, 1);
            NSString *firstNumber = [[NSMutableString alloc] initWithString:[firstHalfString substringWithRange:charRange]];
            NSString *secondNumber = [[NSMutableString alloc] initWithString:[reversedSecondHalfString substringWithRange:charRange]];
            int num1 = [firstNumber intValue];
            int num2 = [secondNumber intValue];
            if(num1 > num2) {
                num2 = num1;
                countOfChangedDigits--;
                [resultStr appendString:[NSString stringWithFormat:@"%d", num1]];
            } else if (num1 < num2) {
                num1 = num2;
                [resultStr appendString:[NSString stringWithFormat:@"%d", num1]];
            } else {
                [resultStr appendString:[NSString stringWithFormat:@"%d", num1]];
            }
        }
    }
    
    if (countOfChangedDigits % 2 == 0 && countOfChangedDigits > 1) {
        for (int i = 0; i < countOfChangedDigits; i+=2) {
            NSRange range = NSMakeRange(i, 1);
            [resultStr replaceCharactersInRange:range withString:maxElement];
        }
    }
    NSMutableString *secondPartOfResultString = [NSMutableString new];
    
    NSInteger charIndex2 = [resultStr length];
    while (charIndex2 > 0) {
        charIndex2--;
        NSRange subStrRange = NSMakeRange(charIndex2, 1);
        [secondPartOfResultString appendString:[resultStr substringWithRange:subStrRange]];
    }
    [resultStr appendString:secondPartOfResultString];
    if([s length] % 2 != 0) {
        return @"-1";
    }
    return resultStr;
}

@end
