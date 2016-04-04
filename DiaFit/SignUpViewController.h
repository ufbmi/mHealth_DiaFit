//
//  SignUpViewController.h
//  DiaFit
//
//  Created by Reynaldo Olivo on 2/3/16.
//  Copyright © 2016 Reynaldo Olivo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *DOBField;
@property (weak, nonatomic) IBOutlet UITextField *weightField;
@property (weak, nonatomic) IBOutlet UITextField *heightField;


- (IBAction)Submit:(id)sender;

@end
