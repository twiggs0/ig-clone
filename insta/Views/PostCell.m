//
//  PostCell.m
//  insta
//
//  Created by Trevon Wiggs on 7/10/18.
//  Copyright © 2018 Trevon Wiggs. All rights reserved.
//

#import "PostCell.h"
#import "Parse.h"
#import "DateTools.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPost:(Post *)post {
    _post = post;
    
    self.postImage.file = post[@"image"];
    [self.postImage loadInBackground];
    
    // Creates a circle frame for the profile pic
    self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width / 2;
    
    self.postCaption.text = post.caption;
    [self.postAuthorButton setTitle:post.author.username forState:UIControlStateNormal];
    
    // Format createdAt date string
    NSDate *createdAtOriginalString = self.post.createdAt;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // Configure the input format to parse the date string
    formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
    
    //Convert String to timeAgo
    NSString *timeAgoDate = [NSDate shortTimeAgoSinceDate:createdAtOriginalString];
    self.createdAt = timeAgoDate;
    self.timestampLabel.text = self.createdAt;
    

}

@end
