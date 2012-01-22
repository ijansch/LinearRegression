//
//  LinearRegressionData.m
//  LinearRegression
//
//  Created by Phillip Porch on 1/22/12.
//  Copyright (c) 2012 ThePorchDotCom. All rights reserved.
//
// This linear regression calculator object expects to be passed an
// Array of x,y values that are doubles

#import "LinearRegression.h"
#import "DataItem.h"

@implementation LinearRegression

@synthesize slope = _slope;
@synthesize intercept = _intercept;
@synthesize sumY = _sumY;
@synthesize sumX = _sumX;
@synthesize sumXY = _sumXY;
@synthesize sumX2 = _sumX2;


- (void)calculateRegression:(NSArray *)theArray {
    
    // theArray should be an array of DataItem objects that each contain
    // two double numbers ( the x and y value of the data)
    // if you created the original array as a NSMutableArray so you could add
    // objects, you will probably want to make a copy like
    // NSArray *theArray = [mutableArray copy]; and then call the linearRegression object like
    // [instanceOfLinearRegressionData calculateRegression:theArray];
    
    NSInteger theNumber = theArray.count;
    self.sumY = 0.0;
    self.sumX = 0.0;
    self.sumXY = 0.0;
    self.sumX2 = 0.0;

    for (DataItem *data in theArray) {
        _sumX = _sumX + data.xValue;
        self.sumY = _sumY + data.yValue;
        self.sumXY = _sumXY + (data.xValue * data.yValue);
        self.sumX2 = _sumX2 + (data.xValue * data.xValue);
    }
    self.slope = ((theNumber * self.sumXY) - self.sumX * self.sumY) / ((theNumber * self.sumX2) - (self.sumX * self.sumX));
 //   NSLog(@"The slope is %f", self.slope);
    self.intercept = ((self.sumY - (self.slope * self.sumX))/theNumber);
//    NSLog(@"The intercept is %f", self.intercept);
}

@end
