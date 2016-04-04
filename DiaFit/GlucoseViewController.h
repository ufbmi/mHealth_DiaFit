//
//  GlucoseViewController.h
//  DiaFit
//
//  Created by Reynaldo Olivo on 2/1/16.
//  Copyright © 2016 Reynaldo Olivo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GlucoseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *GlucRecomLvl;
@property (weak, nonatomic) IBOutlet UILabel *GlucCurrLvl;
@property (weak, nonatomic) IBOutlet UILabel *GlucAvgLvl;
@property (weak, nonatomic) IBOutlet UITextField *GlucRecomLvlInput;
@property (weak, nonatomic) IBOutlet UITextField *GlucCurrLvlInput;
- (IBAction)DailyGraphDisplay:(UIButton *)sender;

@end
