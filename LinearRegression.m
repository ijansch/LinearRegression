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
@synthesize correlation = _correlation;
@synthesize sumY = _sumY;
@synthesize sumX = _sumX;
@synthesize sumXY = _sumXY;
@synthesize sumX2 = _sumX2;
@synthesize sumY2 = _sumY2;


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
    self.sumY2 = 0.0;

    for (DataItem *data in theArray) {
        _sumX = _sumX + data.xValue;
        self.sumY = _sumY + data.yValue;
        self.sumXY = _sumXY + (data.xValue * data.yValue);
        self.sumX2 = _sumX2 + (data.xValue * data.xValue);
        self.sumY2 = _sumY2 + (data.yValue * data.yValue);
    }
    self.slope = ((theNumber * self.sumXY) - self.sumX * self.sumY) / ((theNumber * self.sumX2) - (self.sumX * self.sumX));
    self.intercept = ((self.sumY - (self.slope * self.sumX))/theNumber);
    self.correlation = (theNumber * self.sumXY - (self.sumX * self.sumY)) / (sqrt((theNumber * self.sumX2) - (self.sumX * self.sumX)) *
    (sqrt((theNumber * sumY2) - (self.sumY * self.sumY))));
}

@end
