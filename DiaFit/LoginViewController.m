//
//  LoginViewController.m
//  DiaFit
//
//  Created by Reynaldo Olivo on 2/3/16.
//  Copyright © 2016 Reynaldo Olivo. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LoginViewController (){


    

}
@end

@implementation LoginViewController



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(![defaults boolForKey:@"registered"]){
        NSLog(@"No user registered.");
        [_signRegButton setTitle:@"Register" forState:UIControlStateNormal];
    }
    else {
        NSLog(@"User is registered.");
        [_signRegButton setTitle:@"Login" forState:UIControlStateNormal];
        [_passConfInput setHidden:TRUE];

    }
    
}


-(IBAction)SignRegButton:(id)sender{
    UIAlertController *error = [UIAlertController
                                alertControllerWithTitle: @"oops!"
                                message:@""
                                preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [error dismissViewControllerAnimated:YES completion:nil];
                         }];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; 
    bool userEmpty = [_usernameInput.text isEqualToString:@""];
    bool passEmpty = [_passInput.text isEqualToString:@""];
    bool passConfEmpty = [_passConfInput.text isEqualToString:@""];
    bool registered = [defaults boolForKey:@"registered"];
    if (((userEmpty || passEmpty) && registered) || (userEmpty || passEmpty || passConfEmpty)){
        NSLog(@"Not all the fields are complete");
        [error setMessage:@"Please complete all the fields."];
        [error addAction:ok];
        [self presentViewController:error animated:YES completion:nil];
    }
    else if (!registered && (! ([_passInput.text isEqualToString:(_passConfInput.text)]))){
        NSLog(@"Passwords do not match");
        [error setMessage:@"The passwords do not match."];
        [error addAction:ok];
        [self presentViewController:error animated:YES completion:nil];
    }
    else if (registered) {
         NSLog(@"Check credentials");
        [self checkCredentials];
    }
    else {
        NSLog(@"Register a new user.");
        [self registerNewUser];
    }
}

-(void) registerNewUser {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_usernameInput.text forKey:@"username"];
    [defaults setObject:_passInput.text forKey:@"password"];
    [defaults setBool:YES forKey:(@"registered")];
    UIAlertController *success = [UIAlertController
                                alertControllerWithTitle: @"Success"
                                message:@"You have registered."
                                preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [success dismissViewControllerAnimated:YES completion:nil];
                         }];
    [defaults synchronize];
    [success addAction:ok];
    [self performSegueWithIdentifier:@"SignedIn" sender:self];
    [self presentViewController:success animated:YES completion:nil];
}

-(void) checkCredentials{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if( [(_usernameInput.text) isEqualToString:[defaults objectForKey:@"username"]] && [(_passInput.text) isEqualToString:[defaults objectForKey:@"password"]]){
        _usernameInput.text = nil;
        _passInput.text = nil;
        [self performSegueWithIdentifier:@"SignedIn" sender:self];
    }
    else{
        UIAlertController *unmatchedPass = [UIAlertController
                                      alertControllerWithTitle: @"oops"
                                      message:@"Incorrect username/password."
                                      preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [unmatchedPass dismissViewControllerAnimated:YES completion:nil];
                             }];
        [unmatchedPass addAction:ok];
        [self presentViewController:unmatchedPass animated:YES completion:nil];
        NSLog(@"No good");
    }
}





@end
