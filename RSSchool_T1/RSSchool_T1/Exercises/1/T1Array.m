#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray* resultArray = [NSMutableArray arrayWithArray:sadArray];
    if(resultArray.count >= 2){
        for (int i = 1; i < resultArray.count-1; i++){
            NSNumber *mainElement = [resultArray objectAtIndex:i];
            NSNumber *leftElement = [resultArray  objectAtIndex:i-1];
            NSNumber *rightElement = [resultArray  objectAtIndex:i+1];
            if ([mainElement intValue] > [leftElement intValue] + [rightElement intValue]){
                [resultArray removeObjectAtIndex:i];
                i = 1;
            }
        }
    }
    return resultArray;
}

@end
