//
//  PhysicalViewController.h
//  DiaFit
//
//  Created by Reynaldo Olivo on 1/20/16.
//  Copyright © 2016 Reynaldo Olivo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhysicalViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *StepsTodayLabel;
@property (weak, nonatomic) IBOutlet UITextField *StepsTodayField;
@property (weak, nonatomic) IBOutlet UILabel *CurrentStepCountOutput;

@end

