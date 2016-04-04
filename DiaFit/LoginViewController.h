//
//  LoginViewController.h
//  DiaFit
//
//  Created by Reynaldo Olivo on 2/3/16.
//  Copyright © 2016 Reynaldo Olivo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignUpViewController.h"

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *signRegButton;

@property (weak, nonatomic) IBOutlet UITextField *usernameInput;
@property (weak, nonatomic) IBOutlet UITextField *passInput;
@property (weak, nonatomic) IBOutlet UITextField *passConfInput;


- (IBAction)SignRegButton:(id)sender;



@end
