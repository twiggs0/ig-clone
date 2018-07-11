//
//  ComposeViewController.h
//  insta
//
//  Created by Trevon Wiggs on 7/9/18.
//  Copyright © 2018 Trevon Wiggs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *postPhoto;
@property (weak, nonatomic) IBOutlet UITextField *postCaptionField;


- (IBAction)didTapCancel:(id)sender;
- (IBAction)didTapPhotoPicker:(id)sender;
- (IBAction)didTapShare:(id)sender;

@end
