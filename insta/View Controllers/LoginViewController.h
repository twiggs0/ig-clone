//
//  LoginViewController.h
//  insta
//
//  Created by Trevon Wiggs on 7/9/18.
//  Copyright © 2018 Trevon Wiggs. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)loginButton:(id)sender;
- (IBAction)signupButton:(id)sender;

@end

