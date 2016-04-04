//
//  PhysicalViewController.m
//  DiaFit
//
//  Created by Reynaldo Olivo on 1/20/16.
//  Copyright © 2016 Reynaldo Olivo. All rights reserved.
//

#import "PhysicalViewController.h"
#import "DiaFitHealthKitManager.h"
#import <HealthKit/HealthKit.h>

@interface PhysicalViewController ()

@end

@implementation PhysicalViewController
- (void)viewWillAppear:(BOOL)animated {
    [[DiaFitHealthKitManager sharedManager] requestAuthorization];
    double stepCount = 0;
    stepCount = [[DiaFitHealthKitManager sharedManager] readStepCount:6];
    NSLog(@"Total steps in physical view = :%f", stepCount);
    if (stepCount == 0) {
        // Either user didn't set the date, or an error occured. Simply return.
        return;
    }
    
    /*NSDateComponents *ageComponents = [[NSCalendar currentCalendar]
     components:NSCalendarUnitYear
     fromDate:birthDate
     toDate:[NSDate date]
     options:0];*/
    
    self.CurrentStepCountOutput.text = [NSString stringWithFormat:@"%i", (int)stepCount ];     // Do any additional setup after loading the view, typically from a nib.
    [super viewWillAppear:animated];
}


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
