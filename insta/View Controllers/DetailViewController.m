//
//  DetailViewController.m
//  
//
//  Created by Trevon Wiggs on 7/11/18.
//

#import "DetailViewController.h"
#import "ParseUI.h"
#import "DateTools.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.postImage.file = self.post[@"image"];
    [self.postImage loadInBackground];
    self.captionLabel.text = self.post.caption;
    self.postAuthorLabel.text = self.post.author.username;
    
    self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width / 2;
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
