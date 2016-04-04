//
//  DiaFitHealthKitManager.h
//  DiaFit
//
//  Created by Reynaldo Olivo on 2/5/16.
//  Copyright © 2016 Reynaldo Olivo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthKitManager : NSObject

+ (HealthKitManager *)sharedManager;

- (void)requestAuthorization;

- (NSDate *)readBirthDate;
- (double) readStepCount : (NSInteger) amtOfDays;
- (void)writeWeightSample:(CGFloat)weight;

@end
