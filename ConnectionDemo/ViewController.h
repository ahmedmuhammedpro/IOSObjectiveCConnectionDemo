//
//  ViewController.h
//  ConnectionDemo
//
//  Created by ahmedpro on 3/11/20.
//  Copyright © 2020 ahmedpro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDownloadDelegate>

@property NSMutableData *data;
@property (weak, nonatomic) IBOutlet UIWebView *webView;


- (IBAction) asyncAction:(UIButton *)sender;

- (IBAction) syncAction:(UIButton *)sender;

@end

