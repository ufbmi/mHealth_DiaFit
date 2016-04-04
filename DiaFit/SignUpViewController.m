//
//  SignUpViewController.m
//  DiaFit
//
//  Created by Reynaldo Olivo on 2/3/16.
//  Copyright © 2016 Reynaldo Olivo. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad{
    
}

- (IBAction)Submit:(id)sender {
    if ([_firstNameField.text isEqualToString:@""] || [_lastNameField.text isEqualToString:@""]
        || [_DOBField.text isEqualToString:@""] || [_weightField.text isEqualToString:@""] ||
        [_heightField.text isEqualToString:@""]){
        
        UIAlertController *error = [UIAlertController
                                    alertControllerWithTitle: @"oops!"
                                    message:@"Please fill all the fields."
                                    preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [error dismissViewControllerAnimated:YES completion:nil];
                             }];
        
        [error addAction:ok];
        [self presentViewController:error animated:YES completion:nil];
    }
    else {
        //Do nothing for now.
    }

}



@end
