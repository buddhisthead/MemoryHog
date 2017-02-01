//
//  MemHogViewController.h
//  Memory Hog
//
//  Created by Christopher Tilt on 3/23/12.
//  Copyright (c) 2012 Avatron Software. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ONE_MEG    (1024 * 1000)
#define FIVE_MEG   (5 * ONE_MEG)
#define TEN_MEG   (10 * ONE_MEG)
#define HUNDRED_MEG   (100 * ONE_MEG)

@interface MemHogViewController : UIViewController
{
    IBOutlet UIButton   *plus5MBButton;
    IBOutlet UIButton   *minus5MBButton;
    IBOutlet UIButton   *plus1MBButton;
    IBOutlet UIButton   *minus1MBButton;
    IBOutlet UILabel    *allocatedLabel;
    
    NSMutableArray *fiveMegChunks;
    NSMutableArray *tenMegChunks;
}

@property (nonatomic, retain) IBOutlet UIButton   *plus5MBButton;
@property (nonatomic, retain) IBOutlet UIButton   *minus5MBButton;
@property (nonatomic, retain) IBOutlet UIButton   *plus1MBButton;
@property (nonatomic, retain) IBOutlet UIButton   *minus1MBButton;
@property (nonatomic, retain) IBOutlet UILabel  *allocatedLabel;

- (IBAction) allocationButtonPressed:(id)sender;
natural_t  freeMemory(void);

@end
