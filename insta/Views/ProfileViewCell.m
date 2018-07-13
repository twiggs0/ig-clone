//
//  ProfileViewCell.m
//  insta
//
//  Created by Trevon Wiggs on 7/13/18.
//  Copyright © 2018 Trevon Wiggs. All rights reserved.
//

#import "ProfileViewCell.h"

@implementation ProfileViewCell


- (void)setPost:(Post *)post {
    _post = post;
    
    self.postImage.file = post[@"image"];
    [self.postImage loadInBackground];
}
@end
