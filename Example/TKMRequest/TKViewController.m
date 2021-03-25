//
//  TKViewController.m
//  TKMRequest
//
//  Created by zhengxianda0512@gmail.com on 03/25/2021.
//  Copyright (c) 2021 zhengxianda0512@gmail.com. All rights reserved.
//

#import "TKViewController.h"

#import <TKMRequest/TKMRequest.h>

@interface TKViewController ()

@end

@implementation TKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[TKMRequest shared] registerBaseURL:@"http://localhost:8080/"
                          baseHeaderHook:^NSDictionary * _Nonnull{
        return @{
            
        };
    } baseParamHook:^NSDictionary * _Nonnull{
        return @{
            @"token": @"0123456789"
        };
    }];
    
    [[TKMRequest shared] requestPath:@"token"
                          parameters:@{}
                            callback:^(NSDictionary * _Nonnull response, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%@", response);
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
