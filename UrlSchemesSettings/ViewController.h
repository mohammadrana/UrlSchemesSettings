//
//  ViewController.h
//  UrlSchemesSettings
//
//  Created by Rana on 2/2/17.
//  Copyright © 2017 Rana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIButton *selectScheme;
- (IBAction)selectSchemeAction:(id)sender;

@end

