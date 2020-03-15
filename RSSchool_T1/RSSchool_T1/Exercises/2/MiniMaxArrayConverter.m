#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    int sumOfElements = 0;
    int minElement = [[array objectAtIndex:0] intValue];
    int maxElement = 0;
    for (int i = 0; i < array.count; i++){
        int element = [[array objectAtIndex:i] intValue];
        sumOfElements += element;
        if(minElement > element){
            minElement = element;
        }
        if(maxElement < element){
            maxElement = element;
        }
    }
    return @[[NSNumber numberWithInt:sumOfElements-maxElement], [NSNumber numberWithInt:sumOfElements-minElement]];
}

@end
