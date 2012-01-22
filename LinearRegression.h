//
//  LinearRegressionData.h
//  LinearRegression
//
//  Created by Phillip Porch on 1/22/12.
//  Copyright (c) 2012 ThePorchDotCom. All rights reserved.
//


@interface LinearRegression : NSObject


@property (nonatomic) double slope;
@property (nonatomic) double intercept;
@property (nonatomic) double correlation;
@property (nonatomic) double sumY;
@property (nonatomic) double sumX;
@property (nonatomic) double sumXY;
@property (nonatomic) double sumX2;


- (void)calculateRegression:(NSArray *)data;

@end
