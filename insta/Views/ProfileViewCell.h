//
//  ProfileViewCell.h
//  insta
//
//  Created by Trevon Wiggs on 7/13/18.
//  Copyright © 2018 Trevon Wiggs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "ParseUI.h"

@interface ProfileViewCell : UICollectionViewCell
@property (strong, nonatomic) Post * post;
@property (weak, nonatomic) IBOutlet PFImageView *postImage;

@end
