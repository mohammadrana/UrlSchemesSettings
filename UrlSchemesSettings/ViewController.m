//
//  ViewController.m
//  UrlSchemesSettings
//
//  Created by Rana on 2/2/17.
//  Copyright © 2017 Rana. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *prefArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    prefArray = @[
                  @"General&path=About",
                  @"General&path=ACCESSIBILITY",
                  @"ACCOUNT_SETTINGS",
                  @"AIRPLANE_MODE",
                  @"General&path=AUTOLOCK",
                  @"Brightness",
                  @"General&path=Bluetooth",
                  @"CASTLE",
                  @"General&path=USAGE/CELLULAR_USAGE",
                  @"General&path=ManagedConfigurationList",
                  @"General&path=DATE_AND_TIME",
                  @"FACETIME",
                  @"General",
                  @"INTERNET_TETHERING",
                  @"MUSIC",
                  @"MUSIC&path=EQ",
                  @"MUSIC&path=VolumeLimit",
                  @"General&path=Keyboard",
                  @"General&path=INTERNATIONAL",
                  @"LOCATION_SERVICES",
                  @"General&path=Network",
                  @"NIKE_PLUS_IPOD",
                  @"NOTES",
                  @"NOTIFICATIONS_ID",
                  @"PASSBOOK",
                  @"Phone",
                  @"Photos",
                  @"General&path=Reset",
                  @"Sounds&path=Ringtone",
                  @"Safari",
                  @"General&path=Assistant",
                  @"Sounds",
                  @"General&path=SOFTWARE_UPDATE_LINK",
                  @"CASTLE&path=STORAGE_AND_BACKUP",
                  @"STORE",
                  @"TWITTER",
                  @"General&path=USAGE",
                  @"VIDEO",
                  @"General&path=Network/VPN",
                  @"Wallpaper",
                  @"WIFI",
                  ];
}

- (void)openScheme:(NSInteger)index {
    
    //    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"prefs:root=General&path=%@", [prefArray objectAtIndex:index]]];
    //
    //    if ([[UIApplication sharedApplication] canOpenURL:url]) {
    //        [[UIApplication sharedApplication] openURL:url];
    //    } else {
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"App-Prefs:root=%@", [prefArray objectAtIndex:index]]]];
    //    }
    
    NSString *scheme = [NSString stringWithFormat:@"App-Prefs:root=%@", [prefArray objectAtIndex:index]];
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:scheme];
    
    if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [application openURL:URL options:@{}
           completionHandler:^(BOOL success) {
               NSLog(@"Open %@: %d",scheme,success);
           }];
    } else {
        BOOL success = [application openURL:URL];
        NSLog(@"Open %@: %d",scheme,success);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)selectSchemeAction:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle: nil
                                               destructiveButtonTitle: nil
                                                    otherButtonTitles: nil];
    
    for( NSString *str in prefArray)  {
        [actionSheet addButtonWithTitle:str];
    }
    
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    actionSheet.cancelButtonIndex = [prefArray count];
    actionSheet.delegate = self;
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Index:   %lu", (long)buttonIndex);
    
    [self openScheme:buttonIndex];
}


@end
