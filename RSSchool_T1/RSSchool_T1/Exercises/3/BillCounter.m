#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    int sumOfAnnasChoise = [[bill objectAtIndex:index] intValue];
    int sumOfBill = 0;
    for (int i = 0; i < bill.count; i++) {
        sumOfBill += [[bill objectAtIndex:i] intValue];
    }
    if ((sumOfBill - sumOfAnnasChoise) / 2 == [sum intValue]) {
        return @"Bon Appetit";
    } else {
        return [NSString stringWithFormat:@"%@", [NSNumber numberWithInt:([sum intValue] - (sumOfBill - sumOfAnnasChoise) / 2)]];
    }
}

@end
