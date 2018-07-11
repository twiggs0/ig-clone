//
//  HomeViewController.h
//  insta
//
//  Created by Trevon Wiggs on 7/9/18.
//  Copyright © 2018 Trevon Wiggs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)didTapLogout:(id)sender;

@end
