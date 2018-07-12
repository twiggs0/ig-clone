//
//  DetailViewController.h
//  
//
//  Created by Trevon Wiggs on 7/11/18.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "ParseUI.h"



@interface DetailViewController : UIViewController

@property (strong, nonatomic) Post * post;

@property (nonatomic, strong) NSString *createdAt;
@property (weak, nonatomic) IBOutlet PFImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;

@end
