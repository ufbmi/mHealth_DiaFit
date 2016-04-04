//
//  SignUpView2Controller.m
//  DiaFit
//
//  Created by Reynaldo Olivo on 2/3/16.
//  Copyright © 2016 Reynaldo Olivo. All rights reserved.
//
#import <HealthKit/HealthKit.h>
#import "SignUpView2Controller.h"
#import "HealthKitManager.h"

@interface SignUpView2Controller ()

@end

@implementation SignUpView2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)TriggerHealthKitPermissions:(id)sender {
    [[HealthKitManager sharedManager] requestAuthorization];
}

- (IBAction)FinishSignUp:(id)sender {
}
@end
