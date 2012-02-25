//
//  LinearRegressionData.h
//  LinearRegression
//
//  Created by Phillip Porch on 1/22/12.
//  Copyright (c) 2012 ThePorchDotCom. All rights reserved.
//
#import "RegressionResult.h"

@interface LinearRegression : NSObject

- (RegressionResult *)calculateRegression:(NSArray *)data;

@end
