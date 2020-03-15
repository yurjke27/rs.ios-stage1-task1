#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    char firstBracket;
    char secondBracket;
    NSInteger startOfString = 0;
    NSInteger endOfString = 0;
    NSInteger count = 0;
    NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:0];
    
    for(int i = 0; i < [string length]; i++) {
        firstBracket = [string characterAtIndex:i];
        if(firstBracket == '<') {
            startOfString = i + 1;
            for (int j = i; i < [string length]; j++) {
                secondBracket = [string characterAtIndex:j + 1];
                if (secondBracket == '<') {
                    count++;
                }
                if (secondBracket == '>') {
                    if (count != 0) {
                        count--;
                        continue;
                    }
                    endOfString = j - startOfString + 1;
                    NSRange range = NSMakeRange(startOfString, endOfString);
                    NSString *rangedString = [string substringWithRange:range];
                    [resultArray addObject:rangedString];
                    break;
                }
            }
        }
        
        if(firstBracket == '(') {
            startOfString = i + 1;
            for (int j = i; i < [string length]; j++) {
                secondBracket = [string characterAtIndex:j];
                if (secondBracket == ')') {
                    endOfString = j - startOfString;
                    NSRange range = NSMakeRange(startOfString, endOfString);
                    NSString *rangedString = [string substringWithRange:range];
                    [resultArray addObject:rangedString];
                    i = i + 1;
                    break;
                }
            }
        }
        
        if(firstBracket == '[') {
            startOfString = i + 1;
            for (int j = i; i < string.length; j++) {
                secondBracket = [string characterAtIndex:j];
                if (secondBracket == ']') {
                    endOfString = j - startOfString;
                    NSRange range = NSMakeRange(startOfString, endOfString);
                    NSString *rangedString = [string substringWithRange:range];
                    [resultArray addObject:rangedString];
                    i = i + 1;
                    break;
                }
            }
        }
    }
    return resultArray;
    
}

@end


