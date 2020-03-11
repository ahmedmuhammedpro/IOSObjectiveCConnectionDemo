//
//  ViewController.m
//  ConnectionDemo
//
//  Created by ahmedpro on 3/11/20.
//  Copyright © 2020 ahmedpro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [[NSMutableData alloc] init];
}

- (IBAction)asyncAction:(UIButton *)sender {
    NSURL *url = [[NSURL alloc] initWithString: @"https://www.yahoo.com/"];
    NSString *urlString = [[NSString alloc] initWithContentsOfURL: url encoding: NSUTF8StringEncoding error: nil];
    [_webView loadHTMLString: urlString baseURL: nil];
    printf("done");
}

- (IBAction)syncAction:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString: @"https://twitter.com/"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url];
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest: request delegate: self];
    [con start];
}

- (void) connection: (NSURLConnection *)connection didReceiveData:(nonnull NSData *)data {
    [_data appendData: data];
}

- (void) connectionDidFinishLoading: (NSURLConnection *)connection {
    NSString *str = [[NSString alloc] initWithData: _data encoding: NSUTF8StringEncoding];
    [_webView loadHTMLString: str baseURL: nil];
}

@end
