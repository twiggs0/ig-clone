//
//  PostCell.h
//  insta
//
//  Created by Trevon Wiggs on 7/10/18.
//  Copyright © 2018 Trevon Wiggs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "ParseUI.h"


@interface PostCell : UITableViewCell

@property (strong, nonatomic) Post * post;

@property (strong, nonatomic) IBOutlet PFImageView *postImage;

@property (strong, nonatomic) IBOutlet UILabel *postCaption;

@end
