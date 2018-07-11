//
//  ViewController.m
//  insta
//
//  Created by Trevon Wiggs on 7/9/18.
//  Copyright © 2018 Trevon Wiggs. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerUser {
    PFUser *newUser = [PFUser user];
    
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
            [self presentLoginAlert];
        } else {
            NSLog(@"User registered successfully");
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
            
        }
    }];
}

- (void)loginUser {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
            [self presentLoginAlert];
        } else {
            NSLog(@"User logged in successfully");
            
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        }
    }];
}

// Presents an alert for an empty Username or Text field
- (void)presentTextFieldAlert:(NSString *)username withPassword:(NSString *)password {
    
    if ([username isEqualToString:@""] || [password isEqualToString: @""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing Required Fields" message:@"Your username or password field is empty." preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:^{
        }];
    }
}

// Presents an alert if there is an error on Sign Up or Login
- (void)presentLoginAlert {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"There was an error logging you in." preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:^{
    }];
}


- (IBAction)loginButton:(id)sender {
    [self loginUser];
}

- (IBAction)signupButton:(id)sender {
    [self registerUser];
}
@end
